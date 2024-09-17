uniform float uTime;
uniform sampler2D uPerlinTexture;

varying vec2 vUv;

void main()
{   
    //Scale and animate
    vec2 smokeUv = vUv;
    // We use the vUv here so we can transform it, we can't do it in the varying. 
    smokeUv.x *=0.5;
    smokeUv.y *=0.3;
    smokeUv.y -= uTime * 0.03;

    // Smoke
     float smoke = texture(uPerlinTexture, smokeUv).r;

     // remap
     smoke = smoothstep(0.4, 1.0, smoke);
     

     // edges smooth
     
    smoke *= smoothstep(0.0, 0.1, vUv.x);
    smoke *= smoothstep(1.0, 0.9, vUv.x);
    smoke *= smoothstep(0.0, 0.1, vUv.y);
    smoke *= smoothstep(1.0, 0.4, vUv.y);


    //Final color
    gl_FragColor = vec4(0.4,0.3,0.2,smoke);
    #include <tonemapping_fragment>
     #include <colorspace_fragment>
}