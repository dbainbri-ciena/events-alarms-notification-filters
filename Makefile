all: event batch alarm filter

src/github.com/xeipuuv/gojsonschema:
	GOPATH=$$(pwd) go get github.com/xeipuuv/gojsonschema

event: src/github.com/xeipuuv/gojsonschema
	@echo "\nValidating Event Schema"
	@echo "    An event is an event: $$(GOPATH=$$(pwd) go run validate.go schemas/event.schema.json samples/event.json)"
	@echo "    An event with references is an event: $$(GOPATH=$$(pwd) go run validate.go schemas/event.schema.json samples/event-with-references.json)"

batch: src/github.com/xeipuuv/gojsonschema
	@echo "\nValidating Event Batch"
	@echo "    An events are a batch: $$(GOPATH=$$(pwd) go run validate.go schemas/batch.schema.json samples/batch.json)"
	@echo "    All ports are a batch: $$(GOPATH=$$(pwd) go run validate.go schemas/batch.schema.json samples/all-ports-kpi-event.json)"

alarm: src/github.com/xeipuuv/gojsonschema
	@echo "\nValidating Alarm State Change Event Schema"
	@echo "    An alarm state change is an event: $$(GOPATH=$$(pwd) go run validate.go schemas/event.schema.json samples/alarm.json)"
	@echo "    An alarm state change is an alarm event: $$(GOPATH=$$(pwd) go run validate.go schemas/alarm.schema.json samples/alarm.json)"

filter: src/github.com/xeipuuv/gojsonschema
	@echo "\nValidating Filter Schema"
	@echo "    A filter is a filter: $$(GOPATH=$$(pwd) go run validate.go schemas/filter.schema.json samples/filter.json)"

clean:
	rm -rf src pkg

