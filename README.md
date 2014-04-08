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

Resouces for which the `DELETE` method is implemented have a deletion method shorthand:

```ruby
d = Disdar::Document.get( 123 )
d.delete # DELETE /documents/123
```

### Callback

```ruby
Disdar::Callback.create( url: "http://example.com/disdar", state: "DONE" ) # DELETE /callbacks/uuid
Disdar::Callback.list # GET /callbacks
Disdar::Callback.get( uuid ) # GET /callbacks/uuid
Disdar::Callback.update( uuid, url: "http://example.com/disdar", state: "DONE" ) # DELETE /callbacks/uuid
Disdar::Callback.delete( uuid ) # DELETE /callbacks/uuid
```

A Callback object will have an update method too:

```ruby
c = Disdar::Callback.get( 123 )
c.update( 123, url: "http://example.com/disdar", state: "DONE" ) # calls Disdar::Callback( 123, url: "http://example.com/disdar", state: "DONE" )
```

### Document

```ruby
Disdar::Document.list # GET /documents
Disdar::Document.get( uuid ) # GET /documents/uuid
Disdar::Document.delete( uuid ) # DELETE /documents/uuid
```

You'll also find a helper for GETting the parsing results:

```ruby
d = Disdar::Document.get( 123 )
d.results # results object from parsing the JSON in d.resultsUrl
```

### Export

```ruby
Disdar::Export.create_json( name ) # POST /exports, fileType: EXPORT_JSON
Disdar::Export.create_excel( name ) # POST /exports, fileType: EXPORT_EXCEL
Disdar::Export.list # GET /exports
Disdar::Export.get( uuid ) # GET /exports/uuid
```

### Plan

```ruby
Disdar::Plan.list # GET /plans
Disdar::Plan.get( uuid ) # GET /plans/uuid
```

### Upload

```ruby
Disdar::Upload.list # GET /uploads
Disdar::Upload.get( uuidUpload ) # GET /uploads/uuidUpload
Disdar::Upload.create( filename ) # POST /uploads
Disdar::Upload.delete( uuidUpload ) # DELETE /uploads/uuidUpload
```

You can get an upload's documents subresources with the `documents` helper:

```ruby
u = Disdar::Upload.get( 123 )
u.documents # GET /uploads/123/documents
```

### Unsupported resources

*Authentication*, *Quota* and *Subuser* aren't yet available through this gem.

### Unsupported features

Pagination, which will kick in after the default 100 items per page, is as of yet unsupported by this gem.

Filtering by date/time range is also unsupported.

## Testing

Run the test suite with `rake test`

