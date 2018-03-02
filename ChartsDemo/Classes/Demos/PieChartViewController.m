//
//  PieChartViewController.m
//  ChartsDemo
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

#import "PieChartViewController.h"
#import "ChartsDemo-Swift.h"

@interface PieChartViewController () <ChartViewDelegate>

@property (nonatomic, strong) IBOutlet PieChartView *chartView;
@property (nonatomic, strong) IBOutlet UISlider *sliderX;
@property (nonatomic, strong) IBOutlet UISlider *sliderY;
@property (nonatomic, strong) IBOutlet UITextField *sliderTextX;
@property (nonatomic, strong) IBOutlet UITextField *sliderTextY;

@end

@implementation PieChartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Pie Bar Chart";
    
    self.options = @[
                     @{@"key": @"toggleValues", @"label": @"Toggle Y-Values"},
                     @{@"key": @"toggleXValues", @"label": @"Toggle X-Values"},
                     @{@"key": @"togglePercent", @"label": @"Toggle Percent"},
                     @{@"key": @"toggleHole", @"label": @"Toggle Hole"},
                     @{@"key": @"toggleIcons", @"label": @"Toggle Icons"},
                     @{@"key": @"animateX", @"label": @"Animate X"},
                     @{@"key": @"animateY", @"label": @"Animate Y"},
                     @{@"key": @"animateXY", @"label": @"Animate XY"},
                     @{@"key": @"spin", @"label": @"Spin"},
                     @{@"key": @"drawCenter", @"label": @"Draw CenterText"},
                     @{@"key": @"saveToGallery", @"label": @"Save to Camera Roll"},
                     @{@"key": @"toggleData", @"label": @"Toggle Data"},
                     ];
    
    [self setupPieChartView:_chartView];
    
    _chartView.delegate = self;
    
//    ChartLegend *l = _chartView.legend;
//    l.horizontalAlignment = ChartLegendHorizontalAlignmentRight;
//    l.verticalAlignment = ChartLegendVerticalAlignmentTop;
//    l.orientation = ChartLegendOrientationVertical;
//    l.drawInside = NO;
//    l.xEntrySpace = 7.0;
//    l.yEntrySpace = 0.0;
//    l.yOffset = 0.0;
    
    // entry label styling
//    _chartView.entryLabelColor = UIColor.whiteColor;
    
    _chartView.entryLabelColor = UIColor.redColor;
    _chartView.entryLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f];
    
    _sliderX.value = 4.0;
    _sliderY.value = 100.0;
    [self slidersValueChanged:nil];
    
    _chartView.legend.enabled = NO;
    _chartView.holeColor = UIColor.grayColor;
    _chartView.holeRadiusPercent = 0.2;
    _chartView.drawCenterTextEnabled = NO;
//    _chartView.transparentCircleRadiusPercent = 0.5;
//        _chartView.transparentCircleRadiusPercent = 0.2;
    _chartView.transparentCircleRadiusPercent = 0;
    
    _chartView.entryLabelFont = [UIFont systemFontOfSize:40];
    
    [_chartView animateWithXAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
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
    double mult = range;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
//    for (int i = 0; i < count; i++)
//    {
////        [values addObject:[[PieChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 5) label:parties[i % parties.count] icon: [UIImage imageNamed:@"icon"]]];
//
//        [values addObject:[[PieChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 5) label:nil icon: nil]];
//    }
//
    count = 8;
    int sum = 0;
//    for (int i = 0; i < count; i++)
//    {
//        //        [values addObject:[[PieChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 5) label:parties[i % parties.count] icon: [UIImage imageNamed:@"icon"]]];
//
//        int value = (i + 1) * 10;
//        sum += value;
//        NSLog(@"sum value : %d | value = %ld", sum, value);
//
//           [values addObject:[[PieChartDataEntry alloc] initWithValue: value  label:nil icon: nil]];
////        [values addObject:[[PieChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 5) label:nil icon: nil]];
//    }
//
    count = 1;
    for (int i = 0; i < count; i++)
    {
        //        [values addObject:[[PieChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 5) label:parties[i % parties.count] icon: [UIImage imageNamed:@"icon"]]];
        
        int value = (i + 1) * 10;
        sum += value;
        NSLog(@"sum value : %d | value = %ld", sum, value);
        
        [values addObject:[[PieChartDataEntry alloc] initWithValue: value  label:nil icon: nil]];
        //        [values addObject:[[PieChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 5) label:nil icon: nil]];
    }
    
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:values label: nil];
    dataSet.selectionShift = 0;
//    dataSet.entryLabelFont = [UIFont systemFontOfSize:36];
//    dataSet.entryLabelColor = [UIColor redColor];
//    dataSet.valueFont = [UIFont systemFontOfSize:36];
    dataSet.drawIconsEnabled = NO;
    
//    dataSet.sliceSpace = 2.0;
//    dataSet.iconsOffset = CGPointMake(0, 40);
//    dataSet.iconsOffset = CGPointMake(0, 50);
    
    dataSet.iconsOffset = CGPointMake(0, 40);
    
    
//    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:values label:@"Election Results"];
//
//    dataSet.drawIconsEnabled = NO;
//
//    dataSet.sliceSpace = 2.0;
//    dataSet.iconsOffset = CGPointMake(0, 40);
    
    // add a lot of colors
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObjectsFromArray:ChartColorTemplates.vordiplom];
    [colors addObjectsFromArray:ChartColorTemplates.joyful];
    [colors addObjectsFromArray:ChartColorTemplates.colorful];
    [colors addObjectsFromArray:ChartColorTemplates.liberty];
    [colors addObjectsFromArray:ChartColorTemplates.pastel];
    [colors addObject:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
    
    dataSet.colors = colors;
    
//    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
//
//    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
//    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
//    pFormatter.maximumFractionDigits = 1;
//    pFormatter.multiplier = @1.f;
//    pFormatter.percentSymbol = @" %";
//    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
//    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
//    [data setValueTextColor:UIColor.whiteColor];
    
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
//    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
//    [data setValueTextColor:UIColor.whiteColor];
    
    [data setValueFont: [UIFont systemFontOfSize:20]];
//    [data setValueTextColor:UIColor.whiteColor];
    [data setValueTextColor:UIColor.redColor];
    
    
    
    _chartView.data = data;
    [_chartView highlightValues:nil];
}

- (void)optionTapped:(NSString *)key
{
    if ([key isEqualToString:@"toggleXValues"])
    {
        _chartView.drawSliceTextEnabled = !_chartView.isDrawSliceTextEnabled;
        
        [_chartView setNeedsDisplay];
        return;
    }
    
    if ([key isEqualToString:@"togglePercent"])
    {
        _chartView.usePercentValuesEnabled = !_chartView.isUsePercentValuesEnabled;
        
        [_chartView setNeedsDisplay];
        return;
    }
    
    if ([key isEqualToString:@"toggleHole"])
    {
        _chartView.drawHoleEnabled = !_chartView.isDrawHoleEnabled;
        
        [_chartView setNeedsDisplay];
        return;
    }
    
    if ([key isEqualToString:@"drawCenter"])
    {
        _chartView.drawCenterTextEnabled = !_chartView.isDrawCenterTextEnabled;
        
        [_chartView setNeedsDisplay];
        return;
    }
    
    if ([key isEqualToString:@"animateX"])
    {
        [_chartView animateWithXAxisDuration:1.4];
        return;
    }
    
    if ([key isEqualToString:@"animateY"])
    {
        [_chartView animateWithYAxisDuration:1.4];
        return;
    }
    
    if ([key isEqualToString:@"animateXY"])
    {
        [_chartView animateWithXAxisDuration:1.4 yAxisDuration:1.4];
        return;
    }
    
    if ([key isEqualToString:@"spin"])
    {
        [_chartView spinWithDuration:2.0 fromAngle:_chartView.rotationAngle toAngle:_chartView.rotationAngle + 360.f easingOption:ChartEasingOptionEaseInCubic];
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
