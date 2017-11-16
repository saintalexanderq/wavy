//
//  ViewController.m
//  Wavy
//
//  Created by Alex Quigley on 2017-11-16.
//  Copyright © 2017 Alex Quigley. All rights reserved.
//

#import "ViewController.h"
#import "WavyFlowLayout.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WavyFlowLayout *wavyLayout = [[WavyFlowLayout alloc] init];
    self.collectionView.collectionViewLayout = wavyLayout;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)UICollectionView {
    return 1;
}

-(NSInteger)collectionView: (UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10 + section;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"prototypeCell" forIndexPath:indexPath];
    
    UILabel *label = (UILabel*)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%ld, %ld", indexPath.section+1, indexPath.item+1];
    
    switch (indexPath.section) {
        case 0:
            break;
        case 1:
            cell.backgroundColor = [UIColor redColor];
            
        default: cell.backgroundColor = [UIColor blueColor];
            break;
    }
    return cell;
}






@end
