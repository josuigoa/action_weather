# Action for ideckia: Weather

## Definition

Gets the information from tutiempo.es and shows in the item

## Properties

| Name | Type | Default | Description | Possible values |
| ----- |----- | ----- | ----- | ----- |
| tutiempoKey | String | null | TuTiempo API key | null |
| tutiempoTownIds | Array&lt;UInt&gt; | [] | TuTiempo town id array | null |
| updateInterval | UInt | 15 | Update interval in minutes | null |

## Example in layout file

```json
{
    "state": {
        "text": "action_weather example",
        "bgColor": "00ff00",
        "action": {
            "name": "weather",
            "props": {
                "tutiempoKey": "your_api_key",
                "tutiempoTownIds": [1000]
            }
        }
    }
}
```