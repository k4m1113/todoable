# Todoable
Todoable is a Ruby gem wrapper for the [Todoable HTTP API](http://todoable.teachable.tech/).
Directory structure [yoinked from RubyGems](https://guides.rubygems.org/make-your-own-gem).

## Requirements
Ruby version 2.1+

## Installation
1. clone or download repo
2. compile gem locally:

  `gem build todoable.gemspec`
3. install:

  `gem install ./todoable-0.1.0.gem`

## Usage
`require "todoable"`
### Lists
#### View all lists
*wrapper for **GET /lists***
* **parameters**: none
* **returns**: all lists as JSON object

```ruby
Todoable::List.index
```

#### Create list
*wrapper for **POST /lists***
* **parameters**:
  * `:list` (JSON)
* **returns**: `201` upon success or JSON error message for data problems
```ruby
Todoable::List.new(:list)
```

#### Read list by ID
*wrapper for **GET /lists/:list_id***
* **parameters**:
  * `:list_id` (string)
* **returns**: `201` upon success or JSON error message for data problems

```ruby
Todoable::List.show(:list_id)
```

#### Update list
*wrapper for **PATCH /lists/:list_id***
* **parameters**:
  * `:list_id` (string),
  * `:list` (JSON)
* **returns**: `201` upon success or JSON error message for data problems

```ruby
Todoable::List.update(:list_id, :list)
```

#### Delete list
*wrapper for **DELETE /lists/:list_id***
* **parameters**:
  * `:list_id` (string),
* **returns**: `204` upon successful deletion

```ruby
Todoable::List.delete(:list_id)
```

### Items
#### Create item in list
*wrapper for **POST /lists/:list_id/items***
* **parameters**:
  * `:list_id` (string)
  * `:data` (JSON)
* **returns**: `201` upon success or 422 for data problems
```ruby
Todoable::Item.new(:list_id, :data)
```


#### Mark item in list as finished
*wrapper for **PUT/lists/:list_id/items/:item_id/finish***
* **parameters**:
  * `:list_id` (string)
  * `:item_id` (string)
* **returns**: `200` upon successful completion
```ruby
Todoable::Item.update(:list_id, :item_id)
```

#### DELETE /lists/:list_id/items/:item_id
*wrapper for **DELETE /lists/:list_id/items/:item_id***
* **parameters**:
  * `:list_id` (string)
  * `:item_id` (string)
* **returns**: `204` upon successful deletion
```ruby
Todoable::Item.delete(:list_id, :item_id)
```

## Testing
`rake test` from console
