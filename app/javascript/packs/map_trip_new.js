// ブートストラップ ローダ
(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.Maps_API_Key
});

// Googleからライブラリ(地図)の読み込み
let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");

  // 地図の中心を設定しておく必要がある。 後のmap.setCenterで位置を更新できるが初期値は必須
  // getElementById(id名) この引数にはmapを表示する箇所のid名を記述する ここで紐づけをしている
  map = new Map(document.getElementById("trip_new_map"), {
    center: { lat: 35.681236, lng: 139.767125 },
    zoom: 15,
    mapTypeControl: false
  });
}

// 最初に定義しているasync function initMap() { をここで呼び出している
initMap()


// 1. 地図をクリック→緯度経度を逆ジオコーディングして取得→投稿フォームに反映したい
//===============================================================================================
  map.addListener('click', (event) => {
    // クリックした場所の座標を取得
    const clickedLatLng = event.latLng;
    placeMarker(clickedLatLng);

    // 緯度経度を逆ジオコーディングで住所と郵便番号に変換
    getGeocode(clickedLatLng);
  });

  function placeMarker(location) {
    if (marker) {
      marker.setPosition(location);
    } else {
      marker = new google.maps.Marker({
        position: location,
        map: map
      });
    }
  }

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
      alert('住所を取得できませんでした');
    }
  });
}
//===============================================================================================


// 2. 投稿フォームで郵便番号+住所を入力→地図上でマーカー反映して確認できるようにしたい
//===============================================================================================
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

//===============================================================================================