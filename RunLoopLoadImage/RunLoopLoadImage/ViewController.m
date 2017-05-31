#import "ViewController.h"
//#import "SpaceCell.h"


UIImage *getImg(){
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"jpg"];
    UIImage *img = [UIImage imageWithContentsOfFile:path1];
    return img;
}


static NSString * IDENTIFIER = @"IDENTIFIER";
static CGFloat CELL_HEIGHT = 165;

typedef BOOL(^RunloopBlock)(void);

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *exampleTableView;

@property(nonatomic,strong)NSTimer * timer;

/** 数组  */
@property(nonatomic,strong)NSMutableArray * tasks;
/** 最大任务s */
@property(assign,nonatomic)NSUInteger maxQueueLength;

/** 任务标记  */
@property(nonatomic,strong)NSMutableArray * tasksKeys;

@end

@implementation ViewController

-(void)timerMethod{
    //任何事情都不做!!!
    NSLog(@"=======");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //每隔0.001s定时器走一次，runloop的监听也会持续的走下去。
    //不是一个很完美的解决方法。
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    
    _maxQueueLength = 18;
    _tasks = [NSMutableArray array];
    
    self.exampleTableView = [UITableView new];
    self.exampleTableView.delegate = self;
    self.exampleTableView.dataSource = self;
    self.exampleTableView.frame = self.view.bounds;
    [self.view addSubview:self.exampleTableView];
    
    [self addRunloopObserver];
    
}



- (void)addRunloopObserver{
    
    //获取当前的runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    //定义一个上下文
    CFRunLoopObserverContext  context = {
        0,
        (__bridge void *)self,
        &CFRetain,
        &CFRelease,
        NULL,
    };
    //定义一个观察者
    static CFRunLoopObserverRef defaultModeObserver;
    //创建观察者
    defaultModeObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, NSIntegerMax, &Callback, &context);
    //添加当前runloop的观察者
    CFRunLoopAddObserver(runloop, defaultModeObserver, kCFRunLoopDefaultMode);
    //释放
    CFRelease(defaultModeObserver);
    
    
}

static void Callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    NSLog(@"-------");
    ViewController *vc = (__bridge ViewController*)info;
    if (vc.tasks.count == 0) {
        return;
    }
    BOOL result = NO;
    while (result == NO && vc.tasks.count ) {
        
        //取出任务
        RunloopBlock unit = vc.tasks.firstObject;
        //执行任务
        result = unit();  //YES.所以说只执行了一次。
        //干掉第一个任务
        [vc.tasks removeObjectAtIndex:0];
        //干掉标示
        [vc.tasksKeys removeObjectAtIndex:0];
        
    }
    
}


-(void)addTask:(RunloopBlock)unit withKey:(id)key{
    
    [self.tasks addObject:unit];
    [self.tasksKeys addObject:key];
    
    //保证之前没有显示出来的任务。不再浪费时间加载
    if (self.tasks.count > self.maxQueueLength ) {
        [self.tasks removeObjectAtIndex:0];
        [self.tasksKeys removeObjectAtIndex:0];
        
    }
    
}

+ (void)addImg1WithCell:(UITableViewCell *)cell{
    
    cell.imageView.image = getImg();
    
}

//+ (void)addImg2WithCell:(UITableViewCell *)cell{
//    
//    cell.imgV2.image = getImg();
//}
//
//
//+ (void)addImg3WithCell:(UITableViewCell *)cell{
//    
//    cell.imgV3.image = getImg();
//}



#pragma mark - <tableview>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    
    //合理利用cell的复用。不重复在cell上添加UI。
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:IDENTIFIER];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text =  [NSString stringWithFormat:@"%zd - show the title ", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%zd - show the bottom title text.", indexPath.row];
    
    
    //【实现方法1   耗时操作!!!  丢给每一次RunLoop循环!!!】
    [self addTask:^BOOL{
        [ViewController addImg1WithCell:cell];
        return YES;
    } withKey:indexPath];
//
//    [self addTask:^BOOL{
//        [ViewController addImg2WithCell:cell];
//        return YES;
//    } withKey:indexPath];
//    
//    [self addTask:^BOOL{
//        [ViewController addImg3WithCell:cell];
//        return YES;
//    } withKey:indexPath];
    
    
    //【实现方法2  最传统的方法一个一个的添加】
    //模拟每次取出来的都是不同的照片
    //    cell.imgV1.image = getImg();
    //    cell.imgV2.image = getImg();
    //    cell.imgV3.image = getImg();
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
