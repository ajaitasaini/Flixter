# Project 2 - *Flixter*

**Flixter** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

**Gif was too long, added in repo instead (called "Flixter.gif")**

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] User can view a list of movies currently playing in theaters from The Movie Database.
- [x] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [x] User sees a loading state while waiting for the movies API.
- [x] User can pull to refresh the movie list.
- [x] User can see details regarding a specific movie on a different screen

The following **optional** features are implemented:

- [x] User sees an error message when there's a networking error.
- [x] Movies are displayed using a CollectionView instead of a TableView.
- [x] User can search for a movie.
- [x] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the selection effect of the cell.
- [ ] Customize the navigation bar.
- [x] Customize the UI.

The following **additional** features are implemented:

- [x] Added a trailer in the design view controller

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Avoid repeated code (had a lot of repetition in view controllers)
2. Design a more intuitive layout

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/rRR9glh.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I had a difficult time regarding measurements and having objects appear on the screen in the location I wanted them to be. Moreover, I often got confused about the purpose of my code, which indicates that I need to comment my blocks of code more accurately next time. 

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

Copyright [2018] [Ajaita Saini]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
