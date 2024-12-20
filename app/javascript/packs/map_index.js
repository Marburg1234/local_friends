// ブートストラップ ローダ
(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.Maps_API_Key
});

// ライブラリの読み込み
let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker") // 追記

  // 地図の中心と倍率は公式から変更しています。
    // getElementById(id名) この引数にはmapを表示する箇所のid名を記述する ここで紐づけをしている
  map = new Map(document.getElementById("map"), {
    center: { lat: 35.689, lng: 139.692 },
    zoom: 10,
    mapId: "DEMO_MAP_ID",
    mapTypeControl: false
  });


  try {
    const response = await fetch("/trips.json");
    if (!response.ok) throw new Error('Network response was not ok');

    const { data: { items } } = await response.json();
    if (!Array.isArray(items)) throw new Error("Items is not an array");

    items.forEach( item => {
      const latitude = item.latitude;
      const longitude = item.longitude;
      const title = item.title;
      const tripId = item.id
      // 追記
      const userImage = item.user.image;
      const userName = item.user.name;
      const postImage = item.image;
      const address = item.address;
      const explain = item.explain;

      const marker = new google.maps.marker.AdvancedMarkerElement ({
        position: { lat: latitude, lng: longitude },
        map,
        title: title,
        // 他の任意のオプションもここに追加可能
      });

      // マーカー押して出てくる情報ウィンドウの設定
      const contentString = `
        <div class="information container p-0">
          <div><span class="btn btn-light rounded-pill btn-sm text-light"><a href="/trips/${tripId}">詳細ページへ</a></span></div>
          <div class="mb-3 d-flex align-items-center border-bottom pt-3">
            <img class="rounded-circle mr-2" src="${userImage}" width="40" height="40">
            <p class="lead m-0 font-weight-bold">${userName}</p>
          </div>
          <div class="mb-3">
            <img class="thumbnail" src="${postImage}" loading="lazy" width="250" height="200" style="object-fit: contain;">
          </div>
          <div>
            <h1 class="h4 font-weight-bold">${title}</h1>
            <p class="text-muted">${address}</p>
            <p class="lead">${explain}</p>
          </div>
        </div>
      `;

      const infowindow = new google.maps.InfoWindow({
        content: contentString,
        ariaLabel: title,
      });

      marker.addListener("click", () => {
          infowindow.open({
          anchor: marker,
          map,
        })
      });




    });
  } catch (error) {
    console.error('Error fetching or processing post images:', error);
  }

}

initMap()