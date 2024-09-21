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
  map = new Map(document.getElementById("region_map"), {
    center: { lat: 139.6995, lng: 35.6905 },
    zoom: 8,
    mapId: "DEMO_MAP_ID",
    mapTypeControl: false
  });


  try {
    // fetchを使って、jsonデータ形式のリクエストをする リクエスト先は( )内 URLを参照 .jsonで記述
    // 今回はtrip_showを参照するため、この記述になっている
    const response = await fetch(`/regions/${regionId}.json`);
    // ここの処理でエラーが起きたら、このエラー文を表示する
    if (!response.ok) throw new Error('Network response was not ok');

    // JS特有の記述「分割代入」 { data: { item } } dataプロパティを取り出す
    // dataオブジェクトの中にあるitemプロパティを取り出す 取り出したitem内の値をさらに{ item }に代入する
    // 取り出しと同時に値を代入しているイメージ
    const { data: { item } } = await response.json()
    console.log( item )

      // 各値を取り出して、使いやすくするために変数を用意 格納する
      const latitude = item.latitude;
      const longitude = item.longitude;
      const name = item.name;

      // // マーカーの設定をする
      // const marker = new google.maps.marker.AdvancedMarkerElement ({
      //   position: { lat: latitude, lng: longitude },
      //   map,
      //   title: title,
      //   // 他の任意のオプションもここに追加可能
      // });

      // 地図表示の中心位置 初期値から必要に応じて更新する(今回は投稿記事の緯度経度にしている)
      map.setCenter({ lat: latitude, lng: longitude });


    // エラーがあった際にでる文章の設定
    // 下のエラー文がconsoleで出ていたらこの処理内でのエラー
  } catch (error) {
    console.error('Error fetching or processing trips:', error);
  }

}


// 最初に定義しているasync function initMap() { をここで呼び出している
initMap()
