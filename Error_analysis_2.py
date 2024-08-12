import numpy as np


def twos_complement(value, bits):
    # Calculate the two's complement of an integer value
    if value & (1 << (bits - 1)):
        value -= 1 << bits
    return value


def binary_to_int(binary_str):
    # Convert a binary string to an integer considering two's complement
    if binary_str[0] == '1':  # If the binary string represents a negative value
        return twos_complement(int(binary_str, 2), len(binary_str))
    else:
        return int(binary_str, 2)


def align_binary_strings(accurate_bin):
    # Ensure accurate_bin has a length of 32 bits by aligning
    max_len = 65
    accurate_bin_aligned = []

    for accurate in accurate_bin:
        accurate_len = len(accurate)

        if accurate_len < max_len:
            # Pad accurate binary string with sign extension
            sign_bit = accurate[0]
            accurate_aligned = sign_bit * (max_len - accurate_len) + accurate[1:]
        else:
            accurate_aligned = accurate[-max_len:]

        accurate_bin_aligned.append(accurate_aligned)

    return accurate_bin_aligned


def cem(file):
    # Load data with binary third column
    data = np.loadtxt(file, dtype=str)
    a_ = data[:, 0].astype(int)
    b_ = data[:, 1].astype(int)
    accurate_bin = data[:, 2]

    # Calculate actual values
    actual = a_ + b_

    # Convert actual values to binary strings
    actual_bin1 = np.array([bin(x & 0xFFFFFFFF)[2:].zfill(32) for x in actual])
    actual_bin = np.array(align_binary_strings(actual_bin1))
    # Align binary strings to 32 bits
    accurate_bin_aligned = align_binary_strings(accurate_bin)

    # Calculate Hamming Distance in binary
    ED_bin = np.array([binary_to_int(x) ^ binary_to_int(y) for x, y in zip(actual_bin, accurate_bin_aligned)])
    # ED_bin = np.array([int(x) - int(y) for x, y in zip(actual_bin, accurate_bin_aligned)])
    # print(ED_bin)
    # AD = np.array([int(ED_bin[x]) for x in ED_bin])
    AD = np.array([bin(x).count('1') for x in ED_bin])
    # Mean Absolute Distance (MAD)
    MAD = np.mean(AD)
    # Error rate:
    ER = 100 * (np.sum(actual_bin != accurate_bin_aligned) / len(accurate_bin))

    # Mean Relative Error Distance
    actual_nonzero = np.where(actual == 0, np.nan, actual)
    relative_dist = AD / actual_nonzero
    MRED = np.nanmean(relative_dist)

    # Normalized Mean Absolute Distance
    NMAD = MAD / np.nanmax(actual_nonzero)

    maxe = int(np.max(AD))
    mine = int(np.min(abs(AD)))

    # Print results
    print(f"Total cases: {len(accurate_bin)}")
    print(f"Error rate: {ER:.6f}%")
    print(f"Hamming Distance max: {maxe:.6f}")
    print(f"Hamming Distance min: {mine:.6f}")

    print(f"mean absolute dist. : {MAD:.6f}")
    # Print MRED only if there are no NaN values
    if not np.isnan(MRED):
        print(f"mean relative error distance: {MRED:.6f}")
    print(f"Normalized mean absolute distance: {NMAD:.6f}")


# Example call to the function (ensure the path is correct)
cem("C:\\Users\\user\\Desktop\\mul_16_res.txt")
# cem("C:\\needy soft stuff\\Xilinx_Stuff\\Approx_Multipliers\\Approx_Multipliers.srcs\\sources_1\\new\\mul_32_res_.txt")
