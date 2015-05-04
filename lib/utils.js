export function clone ( source ) {
  return JSON.parse( JSON.stringify( source ) );
}

export function defaults ( target, source ) {
  return Object.keys( source ).reduce(( acc, key ) => {
    if ( !target.hasOwnProperty( key ) ) {
      target[key] = source[key];
    }
    else if ( typeof target[key] === 'object' && !Array.isArray( target[key] ) ) {
      defaults( target[key], source[key] );
    }

    return target;
  }, target);
}

export function forEach ( arr, fn ) {
  Array.prototype.slice.call( arr || [] ).forEach( fn );
}

const VALID_PROPS = ['title', 'description', 'canonical', 'meta', 'link'];

export function isValidProp ( propKey ) {
  return ~VALID_PROPS.indexOf( propKey );
}