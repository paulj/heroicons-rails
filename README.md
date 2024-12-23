# Heroicons for Rails

This gem provides a ViewComponent for rendering Heroicons in Rails apps.

Heroicons are icons from [Heroicons by Tailwind Labs](https://heroicons.com/).

## Installation

Add the gem to your Gemfile:

```ruby
gem "heroicons-rails"
```

## Usage

```ruby
<%= render HeroiconsRails::IconComponent.new("academic-cap", size: 16, style: "solid", classes: ["text-red-500"]) %>
```
