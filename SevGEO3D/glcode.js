Qt.include("three.js")

var camera, scene, renderer;
var cube;
var activeObj;
var torus , cylinder , circle , dodeca;

function initializeGL(canvas) {
    scene = new THREE.Scene();
    camera = new THREE.PerspectiveCamera(75, canvas.width / canvas.height, 0.1, 1000);
    camera.position.z = 10;

    var material = new THREE.MeshBasicMaterial({ color: 0xff0000,
                                                   shading: THREE.SmoothShading });
    var cubeGeometry = new THREE.BoxGeometry(2, 2, 2);
    cube = new THREE.Mesh(cubeGeometry, material);
    cube.rotation.set(0.0, 0.0, 0.0);
    activeObj = cube;
    scene.add(activeObj);

    // wireframe
    var geo = new THREE.EdgesGeometry( cube.geometry );
    var mat = new THREE.LineBasicMaterial( { color: 0x000000, linewidth: 3 } );
    var wireframe = new THREE.LineSegments( geo, mat );
    wireframe.renderOrder = 1; // make sure wireframes are rendered 2nd
    cube.add(wireframe);

    var geometry2 = new THREE.TorusGeometry( 10, 3, 16, 100 );
    var material2 = new THREE.MeshBasicMaterial( { color: 0xff0000 } );
    torus = new THREE.Mesh( geometry2, material2 );
    torus.position.z = -15

    // wireframe
    var geo2 = new THREE.EdgesGeometry( torus.geometry );
    var mat2 = new THREE.LineBasicMaterial( { color: 0x000000, linewidth: 3 } );
    var wireframe2 = new THREE.LineSegments( geo2, mat2 );
    wireframe2.renderOrder = 1; // make sure wireframes are rendered 2nd
    torus.add(wireframe2);

    var geometry3 = new THREE.SphereGeometry( 5, 32,32 );
    var material3 = new THREE.MeshBasicMaterial( { color: 0xff0000 } );
    circle = new THREE.Mesh( geometry3, material3 );

    // wireframe
    var geo3 = new THREE.EdgesGeometry( circle.geometry );
    var mat3 = new THREE.LineBasicMaterial( { color: 0x000000, linewidth: 3 } );
    var wireframe3 = new THREE.LineSegments( geo3, mat3 );
    wireframe3.renderOrder = 1; // make sure wireframes are rendered 2nd
    circle.add(wireframe3);

    var geometry5 = new THREE.CylinderGeometry( 5, 5, 20, 32 );
    var material5 = new THREE.MeshBasicMaterial( {color: 0xff0000} );
    cylinder = new THREE.Mesh( geometry5, material5 );

    var geometry6 = new THREE.DodecahedronGeometry();
    var material6 = new THREE.MeshBasicMaterial( {color: 0xff0000} );
    dodeca = new THREE.Mesh( geometry6, material6 );


    // wireframe
    var geo4 = new THREE.EdgesGeometry( dodeca.geometry );
    var mat4 = new THREE.LineBasicMaterial( { color: 0x000000, linewidth: 3 } );
    var wireframe4 = new THREE.LineSegments( geo4, mat4 );
    wireframe4.renderOrder = 1; // make sure wireframes are rendered 2nd
    dodeca.add(wireframe4);

    //==============================plane==============================
    /*var planeGeo = new THREE.PlaneBufferGeometry(2, 2);

    uniforms = {
        u_time: { type: "f", value: 1.0 },
        u_resolution: { type: "v2", value: new THREE.Vector2() },
        u_mouse: { type: "v2", value: new THREE.Vector2() }
    };

    var planetMat = new THREE.ShaderMaterial({
        uniforms: uniforms,
        vertexShader: document.getElementById('vertexShader').textContent,
        fragmentShader: document.getElementById('fragmentShader').textContent
    });

    var plane = new THREE.Mesh(planeGeo, planetMat);
    */
    //==============================plane==============================

    renderer = new THREE.Canvas3DRenderer(
                { canvas: canvas, antialias: true, devicePixelRatio: canvas.devicePixelRatio });
    renderer.setSize(canvas.width, canvas.height);
    renderer.setClearColor( 0xeeeeee ); // white background - replace ffffff with any hex color
}

function resizeGL(canvas) {
    camera.aspect = canvas.width / canvas.height;
    camera.updateProjectionMatrix();

    //uniforms.u_resolution.value.x = canvas.width;
    //uniforms.u_resolution.value.y = canvas.height;

    renderer.setPixelRatio(canvas.devicePixelRatio);
    renderer.setSize(canvas.width, canvas.height);
}
var animSayac = 0;
function paintGL(canvas) {
    if(animCamActive)
    {
        activeObj.rotation.set(animSayac,animSayac,0);
        animSayac += 0.01;
    }

    renderer.render(scene, camera);
}
function convertTo(D)
{
    switch(D)
    {
    case "2D":
        activeObj.rotation.set(0.0, 0.0, 0.0);
        break;
    case "3D":
        activeObj.rotation.set(0.5, 0.5, 0.0);
        break;

    }
}
var animCamActive = false;
function animCam(value)
{
    animCamActive = value;
}
function changeActiveOBJ(indexObj)
{
    switch(indexObj)
    {
    case "kup":
        scene.remove(activeObj);
        activeObj = cube;
        scene.add(activeObj);
        break;
    case "torus":
        scene.remove(activeObj);
        activeObj = torus;
        scene.add(activeObj);
        break;
    case "cylinder":
        scene.remove(activeObj);
        activeObj = cylinder;
        scene.add(activeObj);
        break;
    case "circle":
        scene.remove(activeObj);
        activeObj = circle;
        scene.add(activeObj);
        break;
    case "dodeca":
        scene.remove(activeObj);
        activeObj = dodeca;
        scene.add(activeObj);
        break;

    }
}
