// Googleからライブラリ(地図)の読み込み
let map;
let marker;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");

  // 地図の中心を設定しておく必要がある。 後のmap.setCenterで位置を更新できるが初期値は必須
  // getElementById(id名) この引数にはmapを表示する箇所のid名を記述する ここで紐づけをしている
  map = new Map(document.getElementById("trip_new_map"), {
    center: { lat: 35.681236, lng: 139.767125 },
    zoom: 15,
    mapTypeControl: false
  });

  // 地図上のクリックイベントを追加
  map.addListener('click', (event) => {
    const clickedLatLng = event.latLng;
    placeMarker(clickedLatLng);
    getGeocode(clickedLatLng);
    console.log(clickedLatLng)
  });
}

// マーカーを地図に置く関数
function placeMarker(location) {
  if (marker) {
    marker.setPosition(location);  // マーカーがすでにある場合は位置を更新
  } else {
    marker = new google.maps.Marker({
      position: location,
      map: map
    });
  }
}

// 逆ジオコーディングで住所と郵便番号を取得する関数
function getGeocode(latlng) {
  const geocoder = new google.maps.Geocoder();

  geocoder.geocode({ location: latlng }, (results, status) => {
    if (status === 'OK' && results[0]) {
      const addressComponents = results[0].address_components;

      // 必要な部分（郵便番号や住所など）を抽出
      const postalCode = addressComponents.find(comp => comp.types.includes('postal_code'));
      const address = results[0].formatted_address;

      // フォームに住所と郵便番号を表示
      document.getElementById('postal_code_input').value = postalCode?.long_name || '';
      document.getElementById('address_input').value = address;
    } else {
      // 住所が取得できない場合のエラーメッセージ
      console.error('Geocode was not successful for the following reason: ' + status);
      alert('住所を取得できませんでした: ' + status);
    }
  });
}

// 投稿フォームの住所を地図に反映する関数
function geocodeAddress() {
  const geocoder = new google.maps.Geocoder();
  const address = document.getElementById('address_input').value;

  geocoder.geocode({ address: address }, (results, status) => {
    if (status === 'OK' && results[0]) {
      const location = results[0].geometry.location;

      // 地図をその場所にズームして移動
      map.setCenter(location);
      placeMarker(location);
    } else {
      alert('住所が見つかりませんでした');
    }
  });
}

// 初期化関数を呼び出して地図を表示
initMap();
