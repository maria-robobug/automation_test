# MemeGenerator Test

### Setup:
1. Install ruby 2.1.1 or higher
2. Open cmd(Windows)/terminal(Mac)
2. Run `gem install bundler` in the root of the project
3. Run `bundle install`

### Running the test:
1. In the project root, run the command: 
`cucumber ./features/meme_generator.feature  --format progress --format html --out=features_report.html`
2. Results report can be seen by opening the generated *features_report.html* in any web browser
