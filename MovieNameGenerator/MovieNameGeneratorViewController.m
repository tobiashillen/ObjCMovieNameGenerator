//
//  MovieNameGeneratorViewController.m
//  MovieNameGenerator
//
//  Created by Tobias Hillén on 2017-01-17.
//  Copyright © 2017 Tobias Hillén. All rights reserved.
//

#import "MovieNameGeneratorViewController.h"

@interface MovieNameGeneratorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (nonatomic) NSArray *adjectives;
@property (nonatomic) NSArray *nouns;

@end

@implementation MovieNameGeneratorViewController

- (IBAction)generateButtonPressed:(id)sender {
    self.movieNameLabel.text = [self someTitle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adjectives = @[@"Total", @"Super", @"Fantastic", @"Lost", @"Magical"];
    self.nouns = @[@"War", @"Love Story", @"Wonder", @"Mystery", @"Journey"];
}

// Randomizer
- (NSString*)randomElement:(NSArray*)array {
    return array[arc4random() % array.count];
}

- (NSString*)simpleTitle {
    NSString *adjective = [self randomElement:self.adjectives];
    NSString *noun = [self randomElement:self.nouns];
    return [NSString stringWithFormat:@"%@ %@", adjective, noun];
}

- (NSString*)advancedTitle {
    NSString *adjective = [self randomElement:self.adjectives];
    NSString *noun1 = [self randomElement:self.nouns];
    NSString *noun2 = [self randomElement:self.nouns];
    return [NSString stringWithFormat:@"%@ of the %@ %@", noun1, adjective, noun2];
}

-(NSString*)someTitle {
    if(arc4random() % 2) {
        return [self simpleTitle];
    } else {
        return [self advancedTitle];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
