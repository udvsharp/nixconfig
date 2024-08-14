{
    generation_number = $1
    date = $3
    time = $4
    nixos_version = $5
    kernel_version = $NF

    print generation_number, date, time
}