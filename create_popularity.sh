curl -XPUT 'http://localhost:9200/popularity' -d '{
    "mappings": {
        "trackingDocument": {
            "_source": {
                "includes": [
                    "meta.*",
                    "doc.*",
                    "_timestamp"
                ]
            },
            "_timestamp": {
                "enabled": true,
                "store": true
            },
            "properties": {
                "doc": {
                    "properties": {
                        "soid": {
                            "type": "string"
                        },
                        "streamid": {
                            "type": "string"
                        },
                        "date": {
                            "type": "date"
                        }
                    }
                }
            }
        }
    }
}'
