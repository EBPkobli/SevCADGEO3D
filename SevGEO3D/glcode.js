Qt.include("three.js")

var camera, scene, renderer;
var cube;

function initializeGL(canvas) {
    scene = new THREE.Scene();
    camera = new THREE.PerspectiveCamera(75, canvas.width / canvas.height, 0.1, 1000);
    camera.position.z = 5;

    var material = new THREE.MeshBasicMaterial({ color: 0xff0000,
                                                   shading: THREE.SmoothShading });
    var cubeGeometry = new THREE.BoxGeometry(2, 2, 2);
    cube = new THREE.Mesh(cubeGeometry, material);
    cube.rotation.set(0.0, 0.0, 0.0);
    scene.add(cube);

    // wireframe
    var geo = new THREE.EdgesGeometry( cube.geometry );
    var mat = new THREE.LineBasicMaterial( { color: 0x000000, linewidth: 3 } );
    var wireframe = new THREE.LineSegments( geo, mat );
    wireframe.renderOrder = 1; // make sure wireframes are rendered 2nd
    cube.add( wireframe );

    renderer = new THREE.Canvas3DRenderer(
                { canvas: canvas, antialias: true, devicePixelRatio: canvas.devicePixelRatio });
    renderer.setSize(canvas.width, canvas.height);
    renderer.setClearColor( 0xeeeeee ); // white background - replace ffffff with any hex color
}

function resizeGL(canvas) {
    camera.aspect = canvas.width / canvas.height;
    camera.updateProjectionMatrix();

    renderer.setPixelRatio(canvas.devicePixelRatio);
    renderer.setSize(canvas.width, canvas.height);
}
var animSayac = 0;
function paintGL(canvas) {
    if(animCamActive)
    {
        cube.rotation.set(animSayac,animSayac,0);
        animSayac += 0.01;
    }

    renderer.render(scene, camera);
}
function convertTo(D)
{
    switch(D)
    {
    case "2D":
        cube.rotation.set(0.0, 0.0, 0.0);
        break;
    case "3D":
        cube.rotation.set(0.5, 0.5, 0.0);
        break;

    }
}
var animCamActive = false;
function animCam(value)
{
    animCamActive = value;
}
