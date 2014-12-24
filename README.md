
A typeahead prediction model suggests words as a user types to improve typing efficiency on constrained mobile devices. This is akin to products such as [Swiftkey](http://swiftkey.com) which is available for Android and iOS mobile devices. This was completed as the Project Capstone for the [Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1) offered by [Johns Hopkins University](http://www.jhu.edu/) through Coursera.

### Installation

    devtools::install_github ("nickwallen/swiftcap")

### Getting Started

    data (blogs)
    fit <- ngram (blogs)
    predict (fit, "What is the next")

### Resources

  * A [web application](https://farsite.shinyapps.io/swiftkey-cap/) was built to showcase the results of this model.
  * A [web presentation](http://rpubs.com/willylane333/swiftkey-cap) was created to describe the underlying statistical model.
