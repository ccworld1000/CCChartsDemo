//
//  LineChart1ViewController.m
//  ChartsDemo
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

#import "LineChart1ViewController.h"
#import "ChartsDemo-Swift.h"

@interface LineChart1ViewController () <ChartViewDelegate> {
//    double datas[332];
    
    double max, min;
}

@property (nonatomic, strong) IBOutlet LineChartView *chartView;
@property (nonatomic, strong) IBOutlet UISlider *sliderX;
@property (nonatomic, strong) IBOutlet UISlider *sliderY;
@property (nonatomic, strong) IBOutlet UITextField *sliderTextX;
@property (nonatomic, strong) IBOutlet UITextField *sliderTextY;

@end

@implementation LineChart1ViewController

- (void) calcMaxMin {
    double datas[] = {
        63922760000,
        101781500000,
        107430800000,
        119859600000,
        141181840000,
        178097640000,
        195300480000,
        224142360000,
        236257440000,
        274311360000,
        237408440000,
        252188280000,
        241256820000,
        258326720000,
        258561580000,
        265125900000,
        302331160000,
        296153980000,
        318020520000,
        335339980000,
        370227860000,
        344077240000,
        339140360000,
        348312200000,
        329436140000,
        316289960000,
        309136680000,
        272561100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        280806080000,
        286546380000,
        284439460000,
        283777060000,
        277457100000,
        272314440000,
        279345880000,
        286420280000,
        300258380000,
        317973840000,
        324269660000,
        324740140000,
        329821820000,
        352578420000,
        362369020000,
        374743180000,
        399632460000,
        398229880000,
        407077280000,
        413927680000,
        410876120000,
        410096360000,
        400915060000,
        402363640000,
        402409540000,
        400456520000,
        394754620000,
        393739920000,
        400348260000,
        415603380000,
        413023060000,
        411342780000,
        402825040000,
        406147140000,
        424358420000,
        423146780000,
        436252980000,
        436175160000,
        430347540000,
        452021480000,
        452217980000,
        450068120000,
        445611360000,
        466394280000,
        467376260000,
        476771940000,
        486992840000,
        493964900000,
        497453920000,
        495380580000,
        499454720000,
        496834760000,
        496483600000,
        497267380000,
        498834760000,
        497387360000,
        493593100000,
        509484700000,
        519082960000,
        546253580000,
        550644240000,
        542766280000,
        550175760000,
        549745200000,
        545551620000,
        545004080000,
        545395860000,
        539170660000,
        545084580000,
        568664180000,
        565412720000,
        561416660000,
        566744360000,
        562867700000,
        568898540000,
        573441740000,
        572228100000,
        571954420000,
        567491000000,
        570899140000,
        570195700000,
        571645160000,
        522257360000,
        516781420000,
        501994320000,
        497068020000,
        493080960000,
        448237280000,
        436091740000,
        432459620000,
        459969760000,
        459266920000,
        467870140000,
        462200980000,
        461615540000,
        460482320000,
        476287840000,
        467682620000,
        462675900000,
        455166240000,
        453759040000,
        449341340000,
        441638980000,
        -155820000,
        -1480480000,
        48698180000,
        45538440000,
        51781640000,
        40392860000,
        28076960000,
        46867380000,
        62007960000,
        37554320000,
        37554320000,
        27652560000,
        53538180000,
        59670920000,
        56546240000,
        54008560000,
        60528380000,
        56976560000,
        59126600000,
        58542380000,
        61586200000,
        59596480000,
        58193020000,
        61978660000,
        62174100000,
        62525440000,
        75714400000,
        72871240000,
        80011980000,
        79777940000,
        72758540000,
        65543660000,
        68745020000,
        63987220000,
        63636560000,
        58647080000,
        66096320000,
        65862440000,
        67071560000,
        64030860000,
        62705400000,
        63173900000,
        62628160000,
        62433360000,
        45744140000,
        64191420000,
        60330780000,
        75471060000,
        75354960000,
        74145400000,
        78594360000,
        79063020000,
        79297280000,
        77385380000,
        73757000000,
        73250180000,
        70481820000,
        74074760000,
        70680180000,
        84727840000,
        80358440000,
        65384160000,
        71348180000,
        73531200000,
        78949700000,
        80236460000,
        64383740000,
        73810980000,
        66182140000,
        68245080000,
        72683200000,
        23098800000,
        34561520000,
        39225620000,
        40236340000,
        31348460000,
        38454040000,
        42998920000,
        61814140000,
        62359680000,
        42022740000,
        41440740000,
        53563500000,
        49646460000,
        49727780000,
        45730080000,
        46196980000,
        46701960000,
        44141020000,
        18419900000,
        18459160000,
        17527660000,
        10659020000,
        1078340000,
        -1325520000,
        4220960000,
        26919380000,
        20246400000,
        19083240000,
        7996540000,
        13388180000,
        20798180000,
        16105100000,
        14129040000,
        17890820000,
        14945640000,
        9950000000,
        19215040000,
        22163060000,
        22318400000,
        20498500000,
        24336080000,
        37127880000,
        37710680000,
        39340360000,
        40890900000,
        44535380000,
        38144860000,
        36539640000,
        34991460000,
        32669700000,
        43705320000,
        43628240000,
        45371920000,
        39215600000,
        42584480000,
        -4665160000,
        5438640000,
        13493280000,
        11761060000,
        23262260000,
        23533720000,
        31631780000,
        34847500000,
        39458360000,
        50156920000,
        52406020000,
        53801900000,
        74552340000,
        81300220000,
        94649100000,
        97404080000,
        96474120000,
        96009260000,
        95042480000,
        71903060000,
        70702560000,
        71750420000,
        71479740000,
        59122160000,
        59279440000,
        59009940000,
        54208780000,
        51733780000,
        38731940000,
        36180900000,
        34711240000,
        16411100000,
        -1565840000,
        33312380000,
        40553600000,
        42297260000,
        29875320000,
        30496360000,
        30535680000,
        31775900000,
        29533100000,
        25743560000,
        62122800000,
        60037040000,
        69604040000,
        64652780000,
        70036760000,
        85419500000,
        69585960000,
        51467160000,
        81322220000,
        80666220000,
        51269180000,
        33369540000,
        31639500000,
        -5668300000,
        88627540000,
        109424420000,
        101315760000,
        26136480000,
        48898440000,
        60243480000,
        438792700000,
        435654420000,
        422545440000,
        422545440000
    };
    
    NSInteger count = sizeof(datas) / sizeof(double);
    BOOL f = YES;
    for (int i = 0; i < count; i++) {
        double value = datas[i];
        
        if (f) {
            max = min = value;
            f = NO;
        }
        
        if (value > max) {
            max = value;
        }
        
        if (value < min) {
            min = value;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self calcMaxMin];
    
    self.title = @"Line Chart 1";
    
    self.options = @[
                     @{@"key": @"toggleValues", @"label": @"Toggle Values"},
                     @{@"key": @"toggleFilled", @"label": @"Toggle Filled"},
                     @{@"key": @"toggleCircles", @"label": @"Toggle Circles"},
                     @{@"key": @"toggleCubic", @"label": @"Toggle Cubic"},
                     @{@"key": @"toggleHorizontalCubic", @"label": @"Toggle Horizontal Cubic"},
                     @{@"key": @"toggleIcons", @"label": @"Toggle Icons"},
                     @{@"key": @"toggleStepped", @"label": @"Toggle Stepped"},
                     @{@"key": @"toggleHighlight", @"label": @"Toggle Highlight"},
                     @{@"key": @"animateX", @"label": @"Animate X"},
                     @{@"key": @"animateY", @"label": @"Animate Y"},
                     @{@"key": @"animateXY", @"label": @"Animate XY"},
                     @{@"key": @"saveToGallery", @"label": @"Save to Camera Roll"},
                     @{@"key": @"togglePinchZoom", @"label": @"Toggle PinchZoom"},
                     @{@"key": @"toggleAutoScaleMinMax", @"label": @"Toggle auto scale min/max"},
                     @{@"key": @"toggleData", @"label": @"Toggle Data"},
                     ];
    
    _chartView.delegate = self;
    
    _chartView.chartDescription.enabled = NO;
    
    _chartView.dragEnabled = YES;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled = YES;
    _chartView.drawGridBackgroundEnabled = NO;

    // x-axis limit line
    ChartLimitLine *llXAxis = [[ChartLimitLine alloc] initWithLimit:10.0 label:@"Index 10"];
    llXAxis.lineWidth = 4.0;
    llXAxis.lineDashLengths = @[@(10.f), @(10.f), @(0.f)];
    llXAxis.labelPosition = ChartLimitLabelPositionRightBottom;
    llXAxis.valueFont = [UIFont systemFontOfSize:10.f];
    
    //[_chartView.xAxis addLimitLine:llXAxis];
    
    _chartView.xAxis.gridLineDashLengths = @[@10.0, @10.0];
    _chartView.xAxis.gridLineDashPhase = 0.f;
    
    ChartLimitLine *ll1 = [[ChartLimitLine alloc] initWithLimit:150.0 label:@"Upper Limit"];
    ll1.lineWidth = 4.0;
    ll1.lineDashLengths = @[@5.f, @5.f];
    ll1.labelPosition = ChartLimitLabelPositionRightTop;
    ll1.valueFont = [UIFont systemFontOfSize:10.0];
    
    ChartLimitLine *ll2 = [[ChartLimitLine alloc] initWithLimit:-30.0 label:@"Lower Limit"];
    ll2.lineWidth = 4.0;
    ll2.lineDashLengths = @[@5.f, @5.f];
    ll2.labelPosition = ChartLimitLabelPositionRightBottom;
    ll2.valueFont = [UIFont systemFontOfSize:10.0];
    
    ChartYAxis *leftAxis = _chartView.leftAxis;
    [leftAxis removeAllLimitLines];
    [leftAxis addLimitLine:ll1];
    [leftAxis addLimitLine:ll2];
//    leftAxis.axisMaximum = 200.0;
//    leftAxis.axisMinimum = -50.0;
    
    leftAxis.axisMaximum = max;
    leftAxis.axisMinimum = min;
    
    leftAxis.gridLineDashLengths = @[@5.f, @5.f];
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;
    
    _chartView.rightAxis.enabled = NO;
    
    //[_chartView.viewPortHandler setMaximumScaleY: 2.f];
    //[_chartView.viewPortHandler setMaximumScaleX: 2.f];
    
    BalloonMarker *marker = [[BalloonMarker alloc]
                             initWithColor: [UIColor colorWithWhite:180/255. alpha:1.0]
                             font: [UIFont systemFontOfSize:12.0]
                             textColor: UIColor.whiteColor
                             insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
    marker.chartView = _chartView;
    marker.minimumSize = CGSizeMake(80.f, 40.f);
    _chartView.marker = marker;
    
    _chartView.legend.form = ChartLegendFormLine;
    
    _sliderX.value = 45.0;
    _sliderY.value = 100.0;
    [self slidersValueChanged:nil];
    
    [_chartView animateWithXAxisDuration:2.5];
    
    _chartView.backgroundColor = [UIColor greenColor];
    NSLog(@"CC _chartView subviews : %@ | %@", _chartView.subviews, _chartView.layer.sublayers);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateChartData
{
    if (self.shouldHideData)
    {
        _chartView.data = nil;
        return;
    }
    
    [self setDataCount:_sliderX.value range:_sliderY.value];
}

- (void)setDataCount:(int)count range:(double)range
{
    double datas[] = {
        63922760000,
        101781500000,
        107430800000,
        119859600000,
        141181840000,
        178097640000,
        195300480000,
        224142360000,
        236257440000,
        274311360000,
        237408440000,
        252188280000,
        241256820000,
        258326720000,
        258561580000,
        265125900000,
        302331160000,
        296153980000,
        318020520000,
        335339980000,
        370227860000,
        344077240000,
        339140360000,
        348312200000,
        329436140000,
        316289960000,
        309136680000,
        272561100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        274757100000,
        280806080000,
        286546380000,
        284439460000,
        283777060000,
        277457100000,
        272314440000,
        279345880000,
        286420280000,
        300258380000,
        317973840000,
        324269660000,
        324740140000,
        329821820000,
        352578420000,
        362369020000,
        374743180000,
        399632460000,
        398229880000,
        407077280000,
        413927680000,
        410876120000,
        410096360000,
        400915060000,
        402363640000,
        402409540000,
        400456520000,
        394754620000,
        393739920000,
        400348260000,
        415603380000,
        413023060000,
        411342780000,
        402825040000,
        406147140000,
        424358420000,
        423146780000,
        436252980000,
        436175160000,
        430347540000,
        452021480000,
        452217980000,
        450068120000,
        445611360000,
        466394280000,
        467376260000,
        476771940000,
        486992840000,
        493964900000,
        497453920000,
        495380580000,
        499454720000,
        496834760000,
        496483600000,
        497267380000,
        498834760000,
        497387360000,
        493593100000,
        509484700000,
        519082960000,
        546253580000,
        550644240000,
        542766280000,
        550175760000,
        549745200000,
        545551620000,
        545004080000,
        545395860000,
        539170660000,
        545084580000,
        568664180000,
        565412720000,
        561416660000,
        566744360000,
        562867700000,
        568898540000,
        573441740000,
        572228100000,
        571954420000,
        567491000000,
        570899140000,
        570195700000,
        571645160000,
        522257360000,
        516781420000,
        501994320000,
        497068020000,
        493080960000,
        448237280000,
        436091740000,
        432459620000,
        459969760000,
        459266920000,
        467870140000,
        462200980000,
        461615540000,
        460482320000,
        476287840000,
        467682620000,
        462675900000,
        455166240000,
        453759040000,
        449341340000,
        441638980000,
        -155820000,
        -1480480000,
        48698180000,
        45538440000,
        51781640000,
        40392860000,
        28076960000,
        46867380000,
        62007960000,
        37554320000,
        37554320000,
        27652560000,
        53538180000,
        59670920000,
        56546240000,
        54008560000,
        60528380000,
        56976560000,
        59126600000,
        58542380000,
        61586200000,
        59596480000,
        58193020000,
        61978660000,
        62174100000,
        62525440000,
        75714400000,
        72871240000,
        80011980000,
        79777940000,
        72758540000,
        65543660000,
        68745020000,
        63987220000,
        63636560000,
        58647080000,
        66096320000,
        65862440000,
        67071560000,
        64030860000,
        62705400000,
        63173900000,
        62628160000,
        62433360000,
        45744140000,
        64191420000,
        60330780000,
        75471060000,
        75354960000,
        74145400000,
        78594360000,
        79063020000,
        79297280000,
        77385380000,
        73757000000,
        73250180000,
        70481820000,
        74074760000,
        70680180000,
        84727840000,
        80358440000,
        65384160000,
        71348180000,
        73531200000,
        78949700000,
        80236460000,
        64383740000,
        73810980000,
        66182140000,
        68245080000,
        72683200000,
        23098800000,
        34561520000,
        39225620000,
        40236340000,
        31348460000,
        38454040000,
        42998920000,
        61814140000,
        62359680000,
        42022740000,
        41440740000,
        53563500000,
        49646460000,
        49727780000,
        45730080000,
        46196980000,
        46701960000,
        44141020000,
        18419900000,
        18459160000,
        17527660000,
        10659020000,
        1078340000,
        -1325520000,
        4220960000,
        26919380000,
        20246400000,
        19083240000,
        7996540000,
        13388180000,
        20798180000,
        16105100000,
        14129040000,
        17890820000,
        14945640000,
        9950000000,
        19215040000,
        22163060000,
        22318400000,
        20498500000,
        24336080000,
        37127880000,
        37710680000,
        39340360000,
        40890900000,
        44535380000,
        38144860000,
        36539640000,
        34991460000,
        32669700000,
        43705320000,
        43628240000,
        45371920000,
        39215600000,
        42584480000,
        -4665160000,
        5438640000,
        13493280000,
        11761060000,
        23262260000,
        23533720000,
        31631780000,
        34847500000,
        39458360000,
        50156920000,
        52406020000,
        53801900000,
        74552340000,
        81300220000,
        94649100000,
        97404080000,
        96474120000,
        96009260000,
        95042480000,
        71903060000,
        70702560000,
        71750420000,
        71479740000,
        59122160000,
        59279440000,
        59009940000,
        54208780000,
        51733780000,
        38731940000,
        36180900000,
        34711240000,
        16411100000,
        -1565840000,
        33312380000,
        40553600000,
        42297260000,
        29875320000,
        30496360000,
        30535680000,
        31775900000,
        29533100000,
        25743560000,
        62122800000,
        60037040000,
        69604040000,
        64652780000,
        70036760000,
        85419500000,
        69585960000,
        51467160000,
        81322220000,
        80666220000,
        51269180000,
        33369540000,
        31639500000,
        -5668300000,
        88627540000,
        109424420000,
        101315760000,
        26136480000,
        48898440000,
        60243480000,
        438792700000,
        435654420000,
        422545440000,
        422545440000
    };
    
    count = sizeof(datas) / sizeof(double);
    
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    
    printf("cc count = %ld", count);
    
    for (int i = 0; i < count; i++)
    {
        double val = arc4random_uniform(range) + 3;
        val = datas[i];
        [values addObject:[[ChartDataEntry alloc] initWithX:i y:val icon: [UIImage imageNamed:@"icon"]]];
    }
    
    LineChartDataSet *set1 = nil;
    if (_chartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_chartView.data.dataSets[0];
        set1.values = values;
        [_chartView.data notifyDataChanged];
        [_chartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:values label:@"DataSet 1"];
        
        set1.drawIconsEnabled = NO;
        
        set1.lineDashLengths = @[@5.f, @2.5f];
        set1.highlightLineDashLengths = @[@5.f, @2.5f];
        [set1 setColor:UIColor.blackColor];
        [set1 setCircleColor:UIColor.blackColor];
        set1.lineWidth = 1.0;
        set1.circleRadius = 3.0;
        set1.drawCircleHoleEnabled = NO;
        set1.valueFont = [UIFont systemFontOfSize:9.f];
        set1.formLineDashLengths = @[@5.f, @2.5f];
        set1.formLineWidth = 1.0;
        set1.formSize = 15.0;
        
        NSArray *gradientColors = @[
                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
                                    ];
        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        
        set1.fillAlpha = 1.f;
        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        set1.drawFilledEnabled = YES;
        
        CGGradientRelease(gradient);
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        
        _chartView.data = data;
    }
}

//- (void)setDataCount:(int)count range:(double)range
//{
//    NSMutableArray *values = [[NSMutableArray alloc] init];
//
//    for (int i = 0; i < count; i++)
//    {
//        double val = arc4random_uniform(range) + 3;
//        [values addObject:[[ChartDataEntry alloc] initWithX:i y:val icon: [UIImage imageNamed:@"icon"]]];
//    }
//
//    LineChartDataSet *set1 = nil;
//    if (_chartView.data.dataSetCount > 0)
//    {
//        set1 = (LineChartDataSet *)_chartView.data.dataSets[0];
//        set1.values = values;
//        [_chartView.data notifyDataChanged];
//        [_chartView notifyDataSetChanged];
//    }
//    else
//    {
//        set1 = [[LineChartDataSet alloc] initWithValues:values label:@"DataSet 1"];
//
//        set1.drawIconsEnabled = NO;
//
//        set1.lineDashLengths = @[@5.f, @2.5f];
//        set1.highlightLineDashLengths = @[@5.f, @2.5f];
//        [set1 setColor:UIColor.blackColor];
//        [set1 setCircleColor:UIColor.blackColor];
//        set1.lineWidth = 1.0;
//        set1.circleRadius = 3.0;
//        set1.drawCircleHoleEnabled = NO;
//        set1.valueFont = [UIFont systemFontOfSize:9.f];
//        set1.formLineDashLengths = @[@5.f, @2.5f];
//        set1.formLineWidth = 1.0;
//        set1.formSize = 15.0;
//
//        NSArray *gradientColors = @[
//                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
//                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
//                                    ];
//        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
//
//        set1.fillAlpha = 1.f;
//        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
//        set1.drawFilledEnabled = YES;
//
//        CGGradientRelease(gradient);
//
//        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
//        [dataSets addObject:set1];
//
//        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
//
//        _chartView.data = data;
//    }
//}

- (void)optionTapped:(NSString *)key
{
    if ([key isEqualToString:@"toggleFilled"])
    {
        for (id<ILineChartDataSet> set in _chartView.data.dataSets)
        {
            set.drawFilledEnabled = !set.isDrawFilledEnabled;
        }
        
        [_chartView setNeedsDisplay];
        return;
    }
    
    if ([key isEqualToString:@"toggleCircles"])
    {
        for (id<ILineChartDataSet> set in _chartView.data.dataSets)
        {
            set.drawCirclesEnabled = !set.isDrawCirclesEnabled;
        }
        
        [_chartView setNeedsDisplay];
        return;
    }
    
    if ([key isEqualToString:@"toggleCubic"])
    {
        for (id<ILineChartDataSet> set in _chartView.data.dataSets)
        {
            set.mode = set.mode == LineChartModeCubicBezier ? LineChartModeLinear : LineChartModeCubicBezier;
        }
        
        [_chartView setNeedsDisplay];
        return;
    }

    if ([key isEqualToString:@"toggleStepped"])
    {
        for (id<ILineChartDataSet> set in _chartView.data.dataSets)
        {
            set.drawSteppedEnabled = !set.isDrawSteppedEnabled;
        }

        [_chartView setNeedsDisplay];
    }
    
    if ([key isEqualToString:@"toggleHorizontalCubic"])
    {
        for (id<ILineChartDataSet> set in _chartView.data.dataSets)
        {
            set.mode = set.mode == LineChartModeHorizontalBezier ? LineChartModeCubicBezier : LineChartModeHorizontalBezier;
        }
        
        [_chartView setNeedsDisplay];
        return;
    }
    
    [super handleOption:key forChartView:_chartView];
}

#pragma mark - Actions

- (IBAction)slidersValueChanged:(id)sender
{
    _sliderTextX.text = [@((int)_sliderX.value) stringValue];
    _sliderTextY.text = [@((int)_sliderY.value) stringValue];
    
    [self updateChartData];
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

@end
