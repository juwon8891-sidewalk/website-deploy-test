'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "403e3edf2a4564414958bcbc0a0a0b2d",
"index.html": "9282dfbee8696936ffeee7faee29832a",
"/": "9282dfbee8696936ffeee7faee29832a",
"images/bi.png": "affadc2db349bf2d18f9e45cfe9a7a87",
"images/forth_img_02.png": "aab87fd15efca1840566271291f86d76",
"images/ci.png": "f6e680e1dbca1cff8550f1b4f4a22716",
"images/forth_img_01.png": "c0cab88f3f50b56763f12425be3817e1",
"images/second_img_03.png": "74f7d55af01ee8523f1352211b85d63b",
"images/button_apple.png": "a80f55afee64587fb06641d7011ce6ce",
"images/second_img_02.png": "e92d384911d95d3175c4079858bb8d52",
"images/button_google.png": "2d5c1b472ac01955ef724e38631a78e6",
"images/stepin_logo.png": "472a495960e1958b790ccd567e74ba62",
"images/second_img_01.png": "a27fc4fa3084023537bb9c785155bf32",
"images/home_title_02.png": "25c88a3976aec1d0d6735e795e66d0cd",
"images/fifth_img_01.png": "6d0e34d96aea2476b615e87f7abc5c7d",
"images/home_title_01.png": "e1125c8fb3424ad1d8299c18450537ae",
"images/third_img_04.png": "af37d3cde69d17902119be132dfb4177",
"images/third_img_02.png": "b6582c33c688a74820bffcecdbb2a4cf",
"images/third_img_03.png": "84d0837fd86e9bd923d517a037d1e225",
"images/third_img_01.png": "2b31b0c7f14802937821e8e1cb802d1d",
"main.dart.js": "a912e3bee91af5539faa61ffb4278c38",
"img.png": "c0cab88f3f50b56763f12425be3817e1",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "593a7d473f52b572e43273d606b6d28d",
"icons/Icon-192.png": "389badfc0204642b805830f20de06627",
"icons/Icon-maskable-192.png": "389badfc0204642b805830f20de06627",
"icons/Icon-maskable-512.png": "c92457d5897609a8915eb7449774e71a",
"icons/Icon-512.png": "c92457d5897609a8915eb7449774e71a",
"manifest.json": "bdcc6b8c0160f35eb2b626973a6962c8",
"assets/AssetManifest.json": "09369c06e49d53bbd96eaa486421b557",
"assets/NOTICES": "4628396dc315a801be7c078707ab642e",
"assets/FontManifest.json": "09ea72b6049d10702090c8b9c2b5da87",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/en-US.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "7df45860a84f72c785174e16b8ec7f8d",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"assets/assets/images/forth_img_02.png": "aab87fd15efca1840566271291f86d76",
"assets/assets/images/forth_img_01.png": "c0cab88f3f50b56763f12425be3817e1",
"assets/assets/images/third_flag.png": "fa8c45b49e7b63aaaae31d1b5fc172b5",
"assets/assets/images/second_img_03.png": "74f7d55af01ee8523f1352211b85d63b",
"assets/assets/images/button_apple.png": "a80f55afee64587fb06641d7011ce6ce",
"assets/assets/images/second_img_02.png": "e92d384911d95d3175c4079858bb8d52",
"assets/assets/images/button_google.png": "2d5c1b472ac01955ef724e38631a78e6",
"assets/assets/images/stepin_logo.png": "472a495960e1958b790ccd567e74ba62",
"assets/assets/images/second_img_01.png": "a27fc4fa3084023537bb9c785155bf32",
"assets/assets/images/home_title_02.png": "25c88a3976aec1d0d6735e795e66d0cd",
"assets/assets/images/fifth_img_01.png": "6d0e34d96aea2476b615e87f7abc5c7d",
"assets/assets/images/home_title_01.png": "e1125c8fb3424ad1d8299c18450537ae",
"assets/assets/images/third_img_04.png": "af37d3cde69d17902119be132dfb4177",
"assets/assets/images/third_img_02.png": "b6582c33c688a74820bffcecdbb2a4cf",
"assets/assets/images/third_img_03.png": "84d0837fd86e9bd923d517a037d1e225",
"assets/assets/images/third_img_01.png": "2b31b0c7f14802937821e8e1cb802d1d",
"assets/assets/fonts/NotoSans/NotoSansKR-Light.otf": "e914a10a1bd0088fb8f743fc7569749f",
"assets/assets/fonts/NotoSans/NotoSansKR-Bold.otf": "e2406ff1791c401bc93e73d9e44e6d2b",
"assets/assets/fonts/NotoSans/NotoSansKR-Medium.otf": "32666ae307200b0bcab5553590672bb1",
"assets/assets/fonts/NotoSans/NotoSansKR-Regular.otf": "210989664066c01d8ffdbdf56bb773cd",
"assets/assets/localization/kr.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/localization/en.json": "9de3078e677ddba873c04d5955726b6f",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
