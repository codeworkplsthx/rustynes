mod nes;
mod externs;

use nes::Nes;

fn main() {}

extern "C" fn test() {
    println!("{}", "aaaaa");
}

#[no_mangle]
pub extern "C" fn run(len: usize, ptr: *mut u8) -> u8 {
    let buf: &mut [u8] = unsafe { std::slice::from_raw_parts_mut(ptr, len) };
    println!("{:?}", buf[0]);
    println!("{}", buf.len());
    externs::set_main_loop(test);
    Nes::new()
}
