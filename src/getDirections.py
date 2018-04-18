# Gets location of origin, destination and stops in between, with instructions, stored as lists
import requests
import json
import urllib
import re


def getRoute_OD(input_origin, input_destination):
    API_key_directions = "AIzaSyB3-8q6wF2coQppBg6-uRBoepL07eCAcWw"
    # Google maps API even autocorrects your spellings...

    # converts to url format
    input_origin = urllib.quote_plus(input_origin)
    input_destination = urllib.quote_plus(input_destination)
    payload = {'origin': input_origin, 'destination': input_destination}

    r_directions = requests.get(
        "https://maps.googleapis.com/maps/api/directions/json?", params=payload)
    j_directions = r_directions.json()

    if "error_message" in j_directions:
        print j_directions['error_message']

    else:
        start_address = j_directions['routes'][0]['legs'][0]['start_address']
        end_address = j_directions['routes'][0]['legs'][0]['end_address']

        start_location = j_directions['routes'][0]['legs'][0]['start_location']
        end_location = j_directions['routes'][0]['legs'][0]['end_location']

        print "Origin Address: ", str(start_address), '\n'
        print "Destination Address: ", str(end_address), '\n'

        print "Origin location: ", str(start_location)
        print "Destination location: ", str(end_location)

        leg_start_location = []
        leg_end_location = []
        leg_instruction = []
        leg_distance = []

        for i in j_directions['routes'][0]['legs'][0]['steps']:
            leg_start_location.append(i['start_location'])
            print "Leg start location: ", str(i['start_location'])

            leg_end_location.append(i['end_location'])
            print "Leg end location: ", str(i['end_location'])

            leg_instruction.append(
                re.sub('<[^<]+?>', '', i['html_instructions']))
            print "Leg instruction: ",re.sub('<[^<]+?>', '', i['html_instructions'])

            leg_distance.append(i['distance'])
            print "Leg distance: ", str(i['distance']['value']), " m", '\n'

        with open('Route: Chinatown-Home Depot(Someville).txt', 'w') as f:
            print >> f, "Origin Address: ", str(start_address), '\n'
            print >> f, "Destination Address: ", str(end_address), '\n'

            print >> f, "Origin location: ", str(start_location), '\n'
            print >> f, "Destination location: ", str(end_location), '\n'
            for i in range(len(leg_distance)):
                print >> f, "Leg start location: ", leg_start_location[i]
                print >> f, "Leg end location: ", leg_end_location[i]
                print >> f, "instruction: ", leg_instruction[i]
                print >> f, "distance: ", leg_distance[i], '\n\n'

def getRoute_DO(input_origin, input_destination):
    API_key_directions = "AIzaSyB3-8q6wF2coQppBg6-uRBoepL07eCAcWw"
    # Google maps API even autocorrects your spellings...

    # converts to url format
    input_origin = urllib.quote_plus(input_origin)
    input_destination = urllib.quote_plus(input_destination)
    payload = {'origin': input_origin, 'destination': input_destination}

    r_directions = requests.get(
        "https://maps.googleapis.com/maps/api/directions/json?", params=payload)
    j_directions = r_directions.json()

    if "error_message" in j_directions:
        print j_directions['error_message']

    else:
        start_address = j_directions['routes'][0]['legs'][0]['start_address']
        end_address = j_directions['routes'][0]['legs'][0]['end_address']

        start_location = j_directions['routes'][0]['legs'][0]['start_location']
        end_location = j_directions['routes'][0]['legs'][0]['end_address']

        print "Origin Address: ", str(start_address), '\n'
        print "Destination Address: ", str(end_location), '\n'

        print "Origin location: ", str(start_location)
        print "Destination location: ", str(end_location)

        leg_start_location = []
        leg_end_location = []
        leg_instruction = []
        leg_distance = []

        for i in j_directions['routes'][0]['legs'][0]['steps']:
            leg_start_location.append(i['start_location'])
            print "Leg start location: ", str(i['start_location'])

            leg_end_location.append(i['end_location'])
            print "Leg end location: ", str(i['end_location'])

            leg_instruction.append(
                re.sub('<[^<]+?>', '', i['html_instructions']))
            print "Leg instruction: ",re.sub('<[^<]+?>', '', i['html_instructions'])

            leg_distance.append(i['distance'])
            print "Leg distance: ", str(i['distance']['value']), " m", '\n'

        with open('Route: Home Depot(Someville)-Chinatown.txt', 'w') as f:
            print >> f, "Origin Address: ", str(start_address), '\n'
            print >> f, "Destination Address: ", str(end_address), '\n'

            print >> f, "Origin location: ", str(start_location), '\n'
            print >> f, "Destination location: ", str(end_location), '\n'
            for i in range(len(leg_distance)):
                print >> f, "Leg start location: ", leg_start_location[i]
                print >> f, "Leg end location: ", leg_end_location[i]
                print >> f, "instruction: ", leg_instruction[i]
                print >> f, "distance: ", leg_distance[i], '\n\n'



destination = "75 Mystic Ave, Somerville, MA 02143"
origin = "150 Harrison Ave, Boston, MA 02111"

# origin = "Government Center, Boston, MA"
# destination = "75 Mystic Ave, Somerville, MA 02143"

# getRoute_OD(origin, destination)
getRoute_DO(destination, origin)
