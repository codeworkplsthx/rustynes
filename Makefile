build:
	mkdir -p wasm
	rm -rf target/wasm32-unknown-emscripten/release/deps/*.wasm
	rm -rf target/wasm32-unknown-emscripten/release/rustynes.js
	cargo rustc --release \
	--target=wasm32-unknown-emscripten -- \
	-C link-args="-s NO_EXIT_RUNTIME=1 -s EXPORTED_FUNCTIONS=['_run'] -s ASYNCIFY=1" \
	--verbose   
	cp target/wasm32-unknown-emscripten/release/rustynes.js wasm/rustynes.js
	cp target/wasm32-unknown-emscripten/release/deps/*.wasm wasm/rustynes.wasm

clean:
	rm -rf target/wasm32-unknown-emscripten/release/deps/*.wasm
	rm -rf target/wasm32-unknown-emscripten/release/rustynes.js  