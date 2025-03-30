import lume from 'lume/mod.ts'
import icons from 'lume/plugins/icons.ts'
import postcss from 'lume/plugins/postcss.ts'
import nesting from 'npm:postcss-nesting'
import googleFonts from 'lume/plugins/google_fonts.ts';


const site = lume({
    src: './src',
    location: new URL('https://maxbesley.com'),
});

// Download the profile picture over the Internet
try {
  const resp = await fetch('https://raw.githubusercontent.com/jigsawpieces/dog-api-images/refs/heads/main/kuvasz/n02104029_1781.jpg');
  const file = await Deno.open('./src/img/profile.jpg', { write: true, create: true });
  await resp.body.pipeTo(file.writable);
} catch (err) {
  const errMsg = 'Error downloading image';
  throw new Error(errMsg, err);
}

site
  .use(icons())
  .use(postcss({
    plugins: [nesting()],
  }))
  .use(googleFonts({
    fonts: 'https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap',
    cssFile: 'styles.css',
  }))
  .copy('img')

export default site;
