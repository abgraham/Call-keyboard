//
//  ViewController.m
//  CallKeyboard
//
//  Created by Annie Graham on 7/8/16.
//  Copyright © 2016 Annie Graham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *viewArray;
@property (nonatomic, strong) UIView *viewOne;
@property (nonatomic, strong) NSMutableDictionary *viewsDictionary;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeViews];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureViewsLoop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeViews{
    
    self.viewsDictionary = [NSMutableDictionary new];
    
    for (int i=0; i<12; i++){
        
        UIView *numberView = [[UIView alloc] init];
        [numberView setTranslatesAutoresizingMaskIntoConstraints:NO];
        numberView.backgroundColor = [UIColor colorWithRed:0.02 green:0.70 blue:0.90 alpha:1.0];
        
        [self.viewArray addObject:numberView];
        [self.view addSubview:numberView];
        [self.viewsDictionary setObject:numberView forKey:[NSString stringWithFormat:@"view%d", i]];
    }
}


- (void)configureViewsLoop{
    
    int marginFromTop = 120;
    
    for (int i=0; i<12; i+=3){
        
        if (i > 0 && (i%3) == 0){
            marginFromTop += 86;
        };
        
        NSString *keyOne = [NSString stringWithFormat:@"view%d", i];
        NSString *keyTwo = [NSString stringWithFormat:@"view%d", i+1];
        NSString *keyThree = [NSString stringWithFormat:@"view%d", i+2];
        
        NSString *horizontalConstraintVFL = [NSString stringWithFormat:@"H:|-50-[%@]-36-[%@(==%@)]-36-[%@(==%@)]-50-|", keyOne, keyTwo, keyOne, keyThree, keyOne];
        
        NSString *verticalConstraintOneVFL= [NSString stringWithFormat:@"V:|-%d-[%@]", marginFromTop, keyOne];
        NSString *verticalConstraintTwoVFL = [NSString stringWithFormat:@"V:|-%d-[%@]", marginFromTop, keyTwo];
        NSString *verticalConstraintThreeVFL = [NSString stringWithFormat:@"V:|-%d-[%@]", marginFromTop, keyThree];
        
        
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:horizontalConstraintVFL
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:self.viewsDictionary];
        
        NSArray *widthConstraint = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[%@(50)]", keyOne]
                                                                           options:0
                                                                           metrics:nil
                                                                             views:self.viewsDictionary];
        NSArray *width2Constraint = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[%@(50)]", keyTwo]
                                                                            options:0
                                                                            metrics:nil
                                                                              views:self.viewsDictionary];
        NSArray *width3Constraint = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[%@(50)]", keyThree]
                                                                            options:0
                                                                            metrics:nil
                                                                              views:self.viewsDictionary];
        
    
        NSArray *vConstraintOne = [NSLayoutConstraint constraintsWithVisualFormat:verticalConstraintOneVFL
                                                                        options:0
                                                                        metrics:nil
                                                                          views:self.viewsDictionary];
        NSArray *vConstraintTwo = [NSLayoutConstraint constraintsWithVisualFormat:verticalConstraintTwoVFL
                                                                       options:0
                                                                       metrics:nil
                                                                         views:self.viewsDictionary];
        NSArray *vConstraintThree = [NSLayoutConstraint constraintsWithVisualFormat:verticalConstraintThreeVFL
                                                                        options:0
                                                                        metrics:nil
                                                                          views:self.viewsDictionary];
        
        [self.view addConstraints:horizontalConstraints];
        
        UIView *viewOne = [self.viewsDictionary objectForKey:keyOne];
        UIView *viewTwo = [self.viewsDictionary objectForKey:keyTwo];
        UIView *viewThree = [self.viewsDictionary objectForKey:keyThree];
        
        [viewOne addConstraints:widthConstraint];
        [viewTwo addConstraints:width2Constraint];
        [viewThree addConstraints:width3Constraint];
        
        [self.view addConstraints:vConstraintOne];
        [self.view addConstraints:vConstraintTwo];
        [self.view addConstraints:vConstraintThree];
    }
    
}

@end
