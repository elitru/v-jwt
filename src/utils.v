module jwt

import encoding.base64

// to_b64_part_without_padding encodes a given string to base 64
// and removes "==" at the end
fn to_b64_part_without_padding(param string) string {
	mut b64 := base64.encode_str(param)

	// remove padding
	return b64.replace("==", "")
}