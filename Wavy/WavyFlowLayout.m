//
//  WavyFlowLayout.m
//  Wavy
//
//  Created by Alex Quigley on 2017-11-16.
//  Copyright © 2017 Alex Quigley. All rights reserved.
//

#import "WavyFlowLayout.h"

@implementation WavyFlowLayout


-(void)prepareLayout {
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    //Set minimum interitem spacing to be huge to force all items to be on their own line
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    
    // Need to copy attrs from super to avoid cached frame mismatch
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attribute in superAttrs){
      
        CGFloat yValue = arc4random_uniform(self.collectionView.frame.size.height - 25)+24;
        CGPoint pointOne = CGPointMake(attribute.frame.origin.x+20, yValue);
        CGSize sizeOne = CGSizeMake(100, yValue*.7);
        attribute.size = sizeOne;
        attribute.center = pointOne;
        self.minimumInteritemSpacing = CGFLOAT_MAX;
        
        [newAttrs addObject:attribute];
    }
    return newAttrs;
}


@end
