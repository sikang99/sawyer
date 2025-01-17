const NodeMediaServer = require('./');

// const config = {
//   rtmp: {
//     port: 1935,
//     chunk_size: 60000,
//     gop_cache: true,
//     ping: 30,
//     ping_timeout: 60,
// 	/*
//     ssl: {
//       port: 443,
//       key: './privatekey.pem',
//       cert: './certificate.pem',
//     }
// 	*/
//   },
//   http: {
//     port: 8080,
//     allow_origin: '*',
//     mediaroot: './media',
//     webroot: './www',ß
//     api: true
//   },
//   https: {
//     port: 8443,
//     key: './privatekey.pem',
//     cert: './certificate.pem',
//   },
//   trans: {
//     ffmpeg: '/usr/bin/ffmpeg',
//     tasks: [
//       {
//         app: 'live',
//         hls: true,
//         hlsFlags: '[hls_time=2:hls_list_size=3:hls_flags=delete_segments]',
//         dash: true,
//         dashFlags: '[f=dash:window_size=3:extra_window_size=5]'
//       }
//     ]
//   },
//   auth: {
//     api: true,
//     api_user: 'admin',
//     api_pass: 'admin',
//     play: false,
//     publish: false,
//     secret: 'teamgrit8266'
//   }
// };

// -- updated by sikang
const fs = require('fs');
const jsonFile = fs.readFileSync('./config.json', 'utf8');
if (jsonFile == undefined) {
  console.log(jsonFile);
}

const config = JSON.parse(jsonFile);
if (config == undefined) {
  console.log(config);
}


let nms = new NodeMediaServer(config)
nms.run();

nms.on('preConnect', (id, args) => {
  console.log('[NodeEvent on preConnect]', `id=${id} args=${JSON.stringify(args)}`);
  // let session = nms.getSession(id);
  // session.reject();
});

nms.on('postConnect', (id, args) => {
  console.log('[NodeEvent on postConnect]', `id=${id} args=${JSON.stringify(args)}`);
});

nms.on('doneConnect', (id, args) => {
  console.log('[NodeEvent on doneConnect]', `id=${id} args=${JSON.stringify(args)}`);
});

nms.on('prePublish', (id, StreamPath, args) => {
  console.log('[NodeEvent on prePublish]', `id=${id} StreamPath=${StreamPath} args=${JSON.stringify(args)}`);
  // let session = nms.getSession(id);
  // session.reject();
});

nms.on('postPublish', (id, StreamPath, args) => {
  console.log('[NodeEvent on postPublish]', `id=${id} StreamPath=${StreamPath} args=${JSON.stringify(args)}`);
});

nms.on('donePublish', (id, StreamPath, args) => {
  console.log('[NodeEvent on donePublish]', `id=${id} StreamPath=${StreamPath} args=${JSON.stringify(args)}`);
});

nms.on('prePlay', (id, StreamPath, args) => {
  console.log('[NodeEvent on prePlay]', `id=${id} StreamPath=${StreamPath} args=${JSON.stringify(args)}`);
  // let session = nms.getSession(id);
  // session.reject();
});

nms.on('postPlay', (id, StreamPath, args) => {
  console.log('[NodeEvent on postPlay]', `id=${id} StreamPath=${StreamPath} args=${JSON.stringify(args)}`);
});

nms.on('donePlay', (id, StreamPath, args) => {
  console.log('[NodeEvent on donePlay]', `id=${id} StreamPath=${StreamPath} args=${JSON.stringify(args)}`);
});

