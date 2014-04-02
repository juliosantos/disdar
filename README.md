# disdar.gem

A RESTful consumer of [Disdar's API](http://disdar.com/api_documentation.html).

[![Build Status](https://travis-ci.org/juliosantos/disdar.svg?branch=master)](https://travis-ci.org/juliosantos/disdar)

## Installation

```bash
gem build disdar-0.0.1
gem install disdar-0.0.1

export DISDAR_API_KEY="your-key"
```

## Resources

Only a subset of [Disdar's available resources](http://disdar.com/api_resource_reference.html) are supported for now.

Resouces for which the `DELETE` method is implemented have a deletion shorthand:

```ruby
d = Disdar::Document.get( 123 )
d.delete # calls inherited Disdar::Document.delete( 123 ) behind the scenes
```

### Callback

*provisionally unsupported*

### Document

```ruby
Disdar::Document.list # GET /documents
Disdar::Document.get( uuid ) # GET /document/uuid
Disdar::Document.delete( uuid ) # DELETE /document/uuid
```

You'll also find a helper for GETting the parsing results:

```ruby
d = Disdar::Document.get( 123 )
d.results # results object from parsing the JSON in d.resultsUrl
```

### Upload

*creation still provisional*

```ruby
Disdar::Upload.list # GET /uploads
Disdar::Upload.get( uuidUpload ) # GET /uploads/uuidUpload
Disdar::Upload.create # POST /uploads
Disdar::Upload.delete( uuidUpload ) # DELETE /uploads/uuidUpload
```

You can get an upload's documents subresources with the `documents` helper:

```ruby
u = Disdar::Upload.get( 123 )
u.documents # GET /uploads/123/documents
```

### Export

*creation still provisional*

```ruby
Disdar::Export.create # POST /exports
```

### Plan

```ruby
Disdar::Plan.list # GET /plans
Disdar::Plan.get( uuid ) # GET /plans/uuid
```

## Testing

The test suite is still underway. For now, only `Disdar::Document` is covered. Run them with `rake test`

