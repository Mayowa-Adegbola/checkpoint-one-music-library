<a href="https://codeclimate.com/github/andela-madegbola/checkpoint-one-music-library"><img src="https://codeclimate.com/github/andela-madegbola/checkpoint-one-music-library/badges/gpa.svg" /></a>

<a href="https://codeclimate.com/github/andela-madegbola/checkpoint-one-music-library/coverage"><img src="https://codeclimate.com/github/andela-madegbola/checkpoint-one-music-library/badges/coverage.svg" /></a>

<a href="https://codeclimate.com/github/andela-madegbola/checkpoint-one-music-library"><img src="https://codeclimate.com/github/andela-madegbola/checkpoint-one-music-library/badges/issue_count.svg" /></a>

[![Build Status](https://travis-ci.org/andela-madegbola/checkpoint-one-music-library.svg?branch=master)](https://travis-ci.org/andela-madegbola/checkpoint-one-music-library)

# Ruby Music Library

## Overview

A CLI music library application that parses a directory/folder of MP3 files and imports them to the music library. It uses the MP3 filenames to categorize them by `Song name`, `Artist`, and `Genre`. It also provides an interactive interface to perform operations like , listing or filtering songs by `Song name`, `Artist`, or `Genre`.


## Functions and Features

The user is able to perform the following operations in the application:

    -> List all the songs in the music library

    -> Get full information about a song's name, artist and genre

    -> List all the artists whose songs are stored in the music library

    -> List all the song genres available in the music library

    -> Play any song selected by song number from the song catalog

    -> List all songs with corresponding genre belonging to any artist of interest

    -> Lists all songs with corresponding artist of any genre of interest


## Instructions for Getting Started

You will require a basic understanding of "Git" and the "Command Line Interface" to use this application.


### Installation

-> Clone the repo to a directory on your local machine using git clone command as shown below:

    $  git clone https://github.com/andela-madegbola/checkpoint-one-music-library.gi

-> Get into the ruby-music-library directory:

    $  cd ruby-music-library

-> Install dependencies

    $  bundle install

### Using the Application

-> To start the application, run bin/musiclibrary from ruby-music-library directory:

    $  cd ruby-music-library

    $  bin/musiclibrary

-> The help menu is displayed at startup as shown below.
   It shows you the relevant commands/actions you can perform in the application.
   Follow the interactive prompts