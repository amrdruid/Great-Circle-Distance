<div align="center">
  <br>
  <h1>Great Circle Distance 👨‍💻</h1>
</div>
<br>


## Start the Project

If you have a Ruby version management tool. That's a good start. If not, consider installing one or download ruby manually. I'd recommend installing rvm or rbenv

rvm: https://github.com/rvm/rvm
rbenv: https://github.com/rbenv/rbenv

### This project uses ruby 2.6.3, to install and use it via rvm: 

`$ rvm install 2.6.3`

`$ rvm use 2.6.3`

via rbenv: 

`$ rbenv install 2.6.3`

`$ rbenv use 2.6.3`

### Download & unzip the project and move to the project directory: 

`$ cd Greate-Circle-Distance-main`

### Or clone the project

`$ git clone git@github.com:amrdruid/Greate-Circle-Distance.git`

`$ cd Greate-Circle-Distance-main`

### Run bundle install for the gems in the gemfile 

`$ bundle install`

### Run the rake task to generate the output for the sample file

`$ rake customers:generate`

input file can be found in "lib/data/customers.txt"

output file can be found in "lib/data/output.txt"

### Run the test suite

$ `rspec spec`

--- 

## Walkthrough

- We have two main files in this project: lib/services/file_parser.rb and lib/services/great_circle_distance.rb

- *"file_parser.rb"* - where the input file parsing and the generation of a new output files happen

-  *"great_circle_distance.rb"* - where the Great Circle Distance logic lives 

- Project is generated as an api as no views would be required

- Added `rubocop` and `rspec` in the gemfile

--- 

Areas for improvement: 

- Dockorize the app to avoid installing tools manually and polluting your machine with things you may not use again
- Send dynamic file pathes through the rake tasks for input and output
- Handling abnormal cases that can occur in the .txt files
- Potentially cache the values if the input txt file has duplicates
- Add error tracking system (i.e: Sentry, Airbrake) to get errors reported and logged
- Potentially transform the logic into a gem instead of a Rails project
- Remove unneeded gems and add versions on the gems that are used if any

---
