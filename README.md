## Vizimusic - Ramaze demo that provides a shopping cart application. The Visimusic application combines the Viziframe framework with the R4Rmusic application as described in David Blacks 'Ruby for Rails' book.

Before working with this application, developers are encouraged to read David Black's book.

This application uses the R4RMusic database with a demo implementation with SQLite and Sequel. Most of the 'Rails' ruby code has been used directly with some small changes to accomodate the syntax differences in the Ramaze language. 

By Al Kivi

Email: al.kivi@vizitrax.com

### About

Vizimusic is a fully functioning application that can be used to learn the basics of the Ramaze language. All of the features in the R4Rmusic application are available in the Vizimusic application.

Some of key features of the original application include:

* The R4RMusic database includes a number of tables with complex relationships between the tables.
* The users can selected products (i.e., music editions) and these are added to the shopping cart.
* Multiple views of composers, editions and instruments are supported.
* User must register with a username and password to fill the shopping cart.
* Once the shopping cart is full, the user move to the check-out operation.
* The application has a dashboard screen that shows the key navigation functions, and show previously selected musical editions.

All of the capabilities of the Viziframe framework are also available:

* The User model in the Viziframe applications replaces the Customer model in the R4RMusic application.
* Refer to the Viziframe application in Github for more information.

### Some key differences between Vizimusic and R4Rmusic.

* The View code has been converted from .rhtml to .xhtml. The templating language are very similar.
* There were a number of 'Linkto' based helpers that could not be easily converted. The helpers were replaced with hard-coded xhtml commands.
* The 'render partial' commands were replaced with equivalent rthml commands.
* The default xthml template was replaced.
* The CSS stylesheet was replaced.
* There were some small changes to the location of partial .rhtml files to accomodate the requirements of the Ramaze language.

### Requirements

* Ruby 1.8.7 or greater
* Sqlite 3.7.13

And the following Gems

* Ramaze 2012.04.14
* Sqlite3 1.3.6
* Sequel 3.37.0
* Rdiscount 1.6.8

### Get started in the Development Environment

* Install SQLite

* Install the required Gems
	* Refer to www.ramaze.net for installation instructions for Ramaze
	* Refer to www.haml.info for installation instructions for Haml
	* Refer to sequel.rubyforge.org for documentation on Sequel

---

* Download zip file from Github
* Extract into application directory (e.g., /apps)
* Use SQLite explorer create the 'music.sqlite' in the /db sub-directory
* Load the 'music.sqlite' using your SQLite administration tools
	* Load the tables and data from the extract file 'music.sql' in the /migrations sub-directory.

---

* Go to the /apps/vizimusic sub-directory to start up the application
* Enter the following in the terminal command line > ramaze start

### Get started in the Production Environment (Passenger)

* Install SQLite

* Install the required Gems

* The app.rb module will look for the value in ENV['RACK_ENV']
	* If the value is nil, then a development environment is assumed
	* If the value is 'production', then it is a production environment. The conditional logic handles a Passenger environment, and makes appropriate adjustments to the Gem paths.
	* You may need to modify the add.rb code to reflect the requirements of your production environment.

### Demo Application

You can view a hosted version of the application at 'music.vizitrax.com'.

### Thanks 

Yorick Peterse and Justkez for their applications that demonstrate the potential capabilities of Ramaze.
