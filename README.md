
# Jwt

A JWT library for V-Lang


## Installation

Install JWT library using [vpm](https://vpm.vlang.io/packages/elitru.jwt)

```bash
  v install elitru.jwt
```

Or directly from github

```bash
  v install https://github.com/elitru/v-jwt
```
_So you must import the module like this: `import jwt`_
## Example

```v
import elitru.jwt // or import jwt

struct Test {
	pub:
		name string
}

fn main() {
	claims := Test {
		name: "John Doe"
	}

	alg := jwt.new_algorithm(jwt.AlgorithmType.hs256)

	jwt_token := jwt.encode<Test>(claims, alg, "Hello", 1000 * 60 * 60) or { 
		panic(err)
	 }
	println(jwt_token)

	claims_decoded := jwt.verify<Test>(jwt_token, alg, "Hello") or {
		panic(err)
	}

	println(claims_decoded)
}
```

```bash
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiSm9obiBEb2UiLCJleHAiOjE3MDY3OTg3NDN9.Cj1KkZs5pv1OIGUnqMEBnrnhL_RiN5YCUHmAHHjG0Og
Test{
    name: 'John Doe'
}
```

## License

[MIT](https://choosealicense.com/licenses/mit/)

