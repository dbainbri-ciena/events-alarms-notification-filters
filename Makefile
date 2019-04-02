all: event alarm notification filter

src/github.com/xeipuuv/gojsonschema:
	GOPATH=$$(pwd) go get github.com/xeipuuv/gojsonschema

event: src/github.com/xeipuuv/gojsonschema
	@echo "\nValidating Event Schema"
	@echo "    An event is an event: $$(GOPATH=$$(pwd) go run validate.go schemas/event.schema.json samples/event.json)"

alarm: src/github.com/xeipuuv/gojsonschema
	@echo "\nValidating Alarm Schema"
	@echo "    An alarm is an event: $$(GOPATH=$$(pwd) go run validate.go schemas/event.schema.json samples/alarm.json)"
	@echo "    An alarm is an alarm: $$(GOPATH=$$(pwd) go run validate.go schemas/alarm.schema.json samples/alarm.json)"

notification: src/github.com/xeipuuv/gojsonschema
	@echo "\nValidating Notification Schema"
	@echo "    A notification is an event: $$(GOPATH=$$(pwd) go run validate.go schemas/event.schema.json samples/notification.json)"
	@echo "    A notification is an alarm: $$(GOPATH=$$(pwd) go run validate.go schemas/alarm.schema.json samples/notification.json)"
	@echo "    A notification is a notification: $$(GOPATH=$$(pwd) go run validate.go schemas/notification.schema.json samples/notification.json)"

filter: src/github.com/xeipuuv/gojsonschema
	@echo "\nValidating Filter Schema"
	@echo "    A filter is a filter: $$(GOPATH=$$(pwd) go run validate.go schemas/filter.schema.json samples/filter.json)"

clean:
	rm -rf src pkg

