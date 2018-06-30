//
//  DetailsViewController.m
//  Flixter
//
//  Created by Ajaita Saini on 6/28/18.
//  Copyright © 2018 Ajaita Saini. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import <WebKit/Webkit.h>

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backDropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterIconView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    //poster view
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    
    [self.posterIconView setImageWithURL:posterURL];
    
    //backdrop view
    NSString *backdropURLString = self.movie[@"backdrop_path"];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    [self.backDropView setImageWithURL:backdropURL];
    
    self.movieTitleLabel.text = self.movie[@"title"];
    self.overviewLabel.text = self.movie[@"overview"];
    [self.overviewLabel sizeToFit];
    
    CGRect newFrame = self.webView.frame;
    newFrame.origin.y = self.overviewLabel.frame.origin.y + self.overviewLabel.frame.size.height + 25;
    self.webView.frame = newFrame;
    
    CGFloat maxHeight = self.overviewLabel.frame.origin.y + self.overviewLabel.frame.size.height + self.webView.frame.size.height;
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, maxHeight);
    
    //video view
    NSString *baseVideoUrlString = @"https://api.themoviedb.org/3/movie/";
    NSNumber *apiKey = self.movie[@"id"];
    NSString *apiKeyString = [apiKey stringValue];
    NSString *apiURLString = @"/videos?api_key=0aa857fc3930af47ad0aed380c1676a7&language=en-US";
    NSString *firstVideoString = [baseVideoUrlString stringByAppendingString:apiKeyString];
    NSString *secondVideoString = [firstVideoString stringByAppendingString:apiURLString];
    NSURL *apiURL = [NSURL URLWithString:secondVideoString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:apiURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Offline"
                                                                           message:@"The internet connection seems to be offline"
                                                                    preferredStyle:(UIAlertControllerStyleAlert)];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Try again"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle response here.
                                                             }];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:^{}];
        }
        else {
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *movieResults = dataDictionary[@"results"][0];
            NSLog(@"%@", movieResults[@"key"]);
            
            NSString *urlString = @"https://www.youtube.com/watch?v=";
            NSString *urlKey = movieResults[@"key"];
            NSString *fullYouTubeURLString = [urlString stringByAppendingString:urlKey];
            NSURL *url = [NSURL URLWithString:fullYouTubeURLString];
            NSURLRequest *request = [NSURLRequest requestWithURL:url
                                                     cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                 timeoutInterval:10.0];
            [self.webView loadRequest:request];
            
        }
    }];
    
    [task resume];
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
    TrailerViewController *trailerViewController = [segue destinationViewController];
    trailerViewController.movie = self.movie;
    
}
 */

@end
