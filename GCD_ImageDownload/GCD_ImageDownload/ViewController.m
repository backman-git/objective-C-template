//
//  ViewController.m
//  GCD_ImageDownload
//
//  Created by Backman on 2017/10/31.
//  Copyright © 2017年 Backman. All rights reserved.
//

/*

    thread 規劃


*/
#import "ViewController.h"
typedef void(^Save10000ToFile)(void);
typedef void(^Sort10000FromFile)(void);
typedef void(^Compute)(void);
//switch
BOOL threading = YES;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
}

- (NSString *) fileLocation{

    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);

    if ([folders count] == 0)
        return nil;
    
    NSString *documentsFolder = [folders objectAtIndex:0];
    return [documentsFolder stringByAppendingPathComponent:@"list.txt"];

    
}


- (BOOL) hasFileAlreadyBeenCreated{
    BOOL result = NO;
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    if ([fileManager fileExistsAtPath:[self fileLocation]] == YES)
    {
        result = YES;
    }
    return result;
}


-(void)viewDidAppear:(BOOL)animated{


    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    

    
    //write 10000 number to disk
    
    Save10000ToFile save10000ToFile = ^(void){
        
        NSUInteger numberOfValuesRequired = 5555555;
        
        NSMutableArray *arrayOfRandomNumbers =[[NSMutableArray alloc] initWithCapacity:numberOfValuesRequired];
        
        NSUInteger counter = 0;
        
        for (counter = 0;counter < numberOfValuesRequired;counter++){
            unsigned int randomNumber =arc4random() % ((unsigned int)RAND_MAX + 1);
            [arrayOfRandomNumbers addObject:[NSNumber numberWithUnsignedInt:randomNumber]];
        }
        [arrayOfRandomNumbers writeToFile:[self fileLocation] atomically:YES];
        
        NSLog(@"save10000 run %@",[NSThread currentThread]);
        
        
        
    };
    
    
    // sort 10000 from file
    Sort10000FromFile sort10000FromFile =^{
    
        NSMutableArray *randomNumbers= [[NSMutableArray alloc] initWithContentsOfFile:[self fileLocation]];
        [randomNumbers sortUsingComparator:
         ^NSComparisonResult(id obj1, id obj2) {
             NSNumber *number1 = (NSNumber *)obj1; NSNumber *number2 = (NSNumber *)obj2; return [number1 compare:number2];
         }];
        
        NSLog(@"sort 999999 %@",[NSThread currentThread]);
        
    
    };
    
    
    Compute compute = ^{

            NSLog(@"compute thread %@",[NSThread currentThread]);
            dispatch_queue_t computeQueue = dispatch_queue_create("my queue", NULL);
        
            if ([self hasFileAlreadyBeenCreated ]== NO)
                if (threading)
                    dispatch_sync(computeQueue,save10000ToFile);
            
                else
                    save10000ToFile();
        
            if ([self hasFileAlreadyBeenCreated ]== YES)
                if (threading)
                    dispatch_async(computeQueue,sort10000FromFile);
            
                else
                    sort10000FromFile();
    };
    
    
    
    // 1. heavy task
    
    if (threading ==YES)
        dispatch_async(concurrentQueue,compute);
    else
        compute();
    
    
    // 2. UI task
    
    // load image
    __block UIImage *img =nil;
    
    NSString* imgURLStrs =@"https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg";
    
    NSURL* imgUrl=[NSURL URLWithString:imgURLStrs];
    NSURLSessionDataTask* downImgTask =[[NSURLSession sharedSession] dataTaskWithURL:imgUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        img = [UIImage imageWithData:data];
        
        NSLog(@"download finish! %@",[NSThread currentThread]);
        dispatch_sync(mainQueue,^{
            _resultImgView.image = img;
            
            NSLog(@"set image finish! %@",[NSThread currentThread]);
            
        });
        
        
    } ];
    
    
    [downImgTask resume];
    
    
    
    
    
   

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
