import jwt

struct Test {
	pub:
		name string
}

fn main() {
	claims := Test {
		name: "John Doe"
	}

	alg := new_algorithm(AlgorithmType.hs256)
	
	jwt := encode<Test>(claims, alg, "Hello", 1000 * 60 * 60)?
	println(jwt)

	claims_decoded := verify<Test>(jwt, alg, "Hello") or {
		panic(err)
	}

	println(claims_decoded)
}