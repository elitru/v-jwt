import elitru.jwt

struct Test {
	pub:
		name string
}

fn main() {
	claims := Test {
		name: "John Doe"
	}

	alg := jwt.new_algorithm(jwt.AlgorithmType.hs256)

	jwt_token := jwt.encode<Test>(claims, alg, "Hello", 1000 * 60 * 60)?
	println(jwt_token)

	claims_decoded := jwt.verify<Test>(jwt_token, alg, "Hello") or {
		panic(err)
	}

	println(claims_decoded)
}