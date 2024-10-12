// ブートストラップ ローダ
(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.Maps_API_Key
});


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
      const country = addressComponents.find(comp => comp.types.includes('country'));
      const formattedAddress = results[0].formatted_address;

      // 「日本」や郵便番号部分を除外するロジック
      let address = formattedAddress;
      if (country) {
        address = address.replace(country.long_name, ''); // 国名を削除
      }
      if (postalCode) {
        address = address.replace(`〒${postalCode.long_name}`, ''); // 〒と郵便番号を削除
      }

      // 不要なカンマや余計な文字を削除
      address = address.replace(/^\s*,\s*|\s*,\s*$|〒\s*\d{3}-\d{4}|、/g, '').trim();


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


// 初期化関数を呼び出して地図を表示
initMap();
