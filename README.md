In order to be fully prepared for the first day of Advent, you can use this small template to aid you in setting the file structure, scraping the puzzle data & running testing solutions for each day.
Inspired by [AoC Rust starter template](https://github.com/fspoettel/advent-of-code-rust) developed by [fspoettel](https://github.com/fspoettel).

Three options are available:

```ruby
  rake setup # scaffold the file structure & scrape your day

  rake test # test a single day (e.g. rake 'test[10]') or the whole suite

  rake run # run a solution for a single day (e.g. rake 'run[12]')

```

**Setup command**

Running setup will open a prompt

```ruby
  def display_menu
    choices = [
      { name: '🌟 Scaffold files for a delightful advent day 🌟', value: 'scaffold' },
      { name: '🎁 Scrape the festive data for an advent day 🎁', value: 'scrape' },
    ]

    prompt.select("", choices)
  end
```

where you can choose to either scaffold the files or scrape the data (or both).

**Scaffold** files command will generate the following file structure within your directory with some minimal boilerplate code to help you start writing the code immediately.

```js
     src
     ├── day1.rb
     ├── day2.rb
     ├── ...


    spec
     ├── day1_spec.rb
     ├── day2_spec.rb
     ├── ...
```

**Scrape** data command will scrape the data for the day you provided via the CLI. Data is stored within a .txt file in the *data* directory. On top of that, if you've already scaffolded the spec files, the provided sample data for that day will be appended to the spec file to help you write the specs more quickly.

```js
     data
     ├── day1.txt
     ├── day2.txt
     ├── ...
```

<span class="text-red-600">**Important!**</span>
<br> To be able to scrape the data, you need to provide a cookie. Cookie can be restored from developers tools in the network tab.

Create a .env file in the rooot directory.
Provide your cookie in ```.env``` file.

```ruby
  AOC_COOKIE="your_cookie_goes_here"
```


