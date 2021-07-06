package tutiempo;

import tutiempo.Types.Prevision;
import js.lib.Promise;
import tink.http.Client.fetch;

class TuTiempoApi {
	static var BASE_URL = 'https://api.tutiempo.net/json/';

	public static var apiKey:String;

	static public function getPrediccion(lid:UInt):Promise<Prevision> {
		return new Promise((resolve, reject) -> {
			fetch('$BASE_URL?lan=en&apid=$apiKey&lid=$lid').all().handle(o -> switch o {
				case Success(res):
					resolve((tink.Json.parse(res.body.toString()) : Prevision));
				case Failure(e):
					reject(e);
			});
		});
	}
}
