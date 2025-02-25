import lume from 'lume/mod.ts';

const site = lume({
  src: './src',
});

site.ignore('README.md', 'infra');

export default site;
