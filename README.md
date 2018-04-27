logic-gen is a logic organizer for your application. It creates a structure for you to put your business logic so your controllers, models and even mailers
stay thin.

## Installation

```ruby
$ gem 'logic-gen', :git => 'git@github.com:jeffsouza/logic-gen.git'
```

## Configuration

```ruby
$ rails g logicgen:config
```

## Getting Started

#### For Controllers

```ruby
$ rails g logicgen:controller --name posts
```
It will:
- Create a file in <tt>app/logic/controllers</tt> named <tt>posts_controller_logic.rb</tt>
- Include the module inside controller <tt>PostsController</tt>

#### For Models

```ruby
$ rails g logicgen:model --name posts
```
It will:
- Create a file in <tt>app/logic/models</tt> named <tt>post_logic.rb</tt>
- Include the module inside model <tt>Post</tt>