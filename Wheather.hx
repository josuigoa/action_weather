package;

import haxe.crypto.Base64;
import tutiempo.TuTiempoApi;

using api.IdeckiaApi;

typedef Props = {
	@:editable("TuTiempo API key", null)
	var tutiempoKey:String;
	@:editable("TuTiempo town id array", [])
	var tutiempoTownIds:Array<UInt>;
	@:editable("Update interval in minutes", 15)
	var updateInterval:UInt;
}

@:name('weather')
class Wheather extends IdeckiaAction {
	var state:ItemState;
	var currentTownIndex:UInt;

	override public function init(initialState:ItemState):js.lib.Promise<ItemState> {
		state = initialState;

		currentTownIndex = 0;
		TuTiempoApi.apiKey = props.tutiempoKey;

		var timer = new haxe.Timer(props.updateInterval * 60 * 1000);
		timer.run = function() {
			getPrediction(state, server.updateClientState, server.log);
		};

		return execute(state);
	}

	public function execute(currentState:ItemState):js.lib.Promise<ItemState> {
		return new js.lib.Promise((resolve, reject) -> {
			if (props.tutiempoTownIds.length == 0 || currentTownIndex == -1)
				reject('Town id not found');

			getPrediction(currentState, resolve, reject);
		});
	}

	override public function onLongPress(currentState:ItemState):js.lib.Promise<ItemState> {
		return new js.lib.Promise((resolve, reject) -> {
			if (currentTownIndex == -1)
				reject('Town id not found');

			currentTownIndex = (currentTownIndex + 1) % props.tutiempoTownIds.length;
			getPrediction(currentState, resolve, reject);
		});
	}

	function getPrediction(currentState:ItemState, resolve:ItemState->Void, reject:Any->Void) {
		TuTiempoApi.getPrediccion(props.tutiempoTownIds[currentTownIndex]).then(p -> {
			var h = p.hour_hour.hour1;
			server.log('prevision.hour1: $h');
			var time = DateTools.format(Date.now(), '%H:%M');
			currentState.text = '${p.locality.name}\n$time ${h.temperature}ºC';
			currentState.icon = Base64.encode(haxe.Resource.getBytes('wi${h.icon}'));
			resolve(currentState);
		}).catchError(reject);
	}
}
