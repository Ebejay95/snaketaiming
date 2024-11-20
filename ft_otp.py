# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_otp.py                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joeberle <joeberle@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/18 20:55:20 by joeberle          #+#    #+#              #
#    Updated: 2024/11/19 10:13:00 by joeberle         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

import sys
import time
import argparse
from colorama import Fore, Style

def check_hexa_dec(value):
    if not isinstance(value, str) or not all(c in "0123456789abcdefABCDEF" for c in value):
        raise argparse.ArgumentTypeError(f"{value} is not a hexadecimal character.")
    if len(value) < 64:
        raise argparse.ArgumentTypeError(f"{value} must contain 64 characters.")
    return value

def main():
    parser = argparse.ArgumentParser(
        description="FT_OTP: Generates one-time passwords (TOTP/HOTP)."
    )
    parser.add_argument(
        "-g",
        type=check_hexa_dec,
        help="Hexadecimal key, which is saved in ft_otp.key file."
    )
    parser.add_argument(
        "-l",
        help="Path to ft_otp.key, for generating OTPs.",
    )

    args = parser.parse_args()

    if args.g and args.l:
        print(f"{Fore.RED}Error: Only one of the options -g or -l has to be given.{Style.RESET_ALL}", file=sys.stderr)
        sys.exit(1)

    if args.g:
        print(f"\n{Fore.CYAN}Generating keyfile ft_otp.key...{Style.RESET_ALL}")
        print(f"Seed: {Fore.YELLOW}{args.g}{Style.RESET_ALL}\n")
        print(f"{Fore.GREEN}Success!{Style.RESET_ALL}")

    elif args.l:
        print(f"\n{Fore.CYAN}Generating OTP from the keyfile ft_otp.key...{Style.RESET_ALL}")
        print(f"File: {Fore.YELLOW}{args.l}{Style.RESET_ALL}\n")
        print(f"{Fore.GREEN}Success!{Style.RESET_ALL}")

    else:
        print(f"{Fore.RED}Error: Either option -g or -l has to be given.{Style.RESET_ALL}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
