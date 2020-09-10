import sys
import street
import errorhandler
import re

def parse_input(input_data):
    try:
        input_list = input_data.strip().split()
        command = input_list[0]
        street_data = street.Street()
        check_error  = errorhandler.Errors()
        if check_error.checkInput(input_data):
            if command == 'a' or command == 'c' or command == 'r':
                street_name = re.findall(r'"([^"]*)"', input_data)[0]
            if command == 'a':
                coordinates = street_data.getCoordinates(input_data)
                if check_error.checkStreetFormat(street_name.lower()) and coordinates != False:
                    street_data.addStreet(street_name.lower(),coordinates, 'a')
                else:
                    sys.stderr.write("Error : Street Format incorrect\n")
                    sys.stdout.flush()
            elif command == 'c':
                coordinates = street_data.getCoordinates(input_data)
                if coordinates != False:
                    removed = street_data.removeStreet(street_name.lower())
                    if removed == "SUCCESS":
                        street_data.addStreet(street_name.lower(), coordinates,'c')
                else:
                    sys.stderr.write("Error : Street Format incorrect\n")
                    sys.stdout.flush()
            elif command == 'r':
                street_data.removeStreet(street_name.lower())
            elif command == 'g':
                street_data.generateGraph()
            else:
                sys.stderr.write('Error : Command not found\n')
                sys.stdout.flush()
        else:
            sys.stderr.write('Error : Input Format not correct\n')
            sys.stdout.flush()
    except IndexError:
        return

def main():
     while(True):
        input_command = sys.stdin.readline()
        if input_command == '':
           break
	elif "Error" in input_command:
	   sys.stderr.write(input_command)
	   break
        else :
       	   parse_input(input_command)
     sys.exit(0)
if __name__ == '__main__':
    main()
