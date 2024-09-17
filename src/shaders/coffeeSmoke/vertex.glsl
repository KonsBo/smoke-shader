varying vec2 vuv;

void main()
{
    //Final position
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0);

    //Varying
    vUv = uv;
}