import React, { createContext, useEffect, useState} from 'react';
import {
  SimpleGrid,
  Container,
  Box,
  Heading,
  Flex,
  Fade
} from "@chakra-ui/react";
import SkillsList from "./body/skillslist";
import './App.css'
import {debugData} from "../utils/debugData";
import { Skill } from "../interfaces/skill";
import { useNuiEvent } from "../hooks/useNuiEvent";
import {fetchNui} from "../utils/fetchNui";

interface VariableProps {
  skills: Array<Skill>;
}

interface Props extends VariableProps {}

const mockData: Props = {
  skills: [
    {label: "Chemistry", level: 28, xp: 324, percent: 50, description: 'test tooltip'},
    {label: "Cooking", level: 35, xp: 324, percent: 32, description: 'test tooltip'},
    {label: "Crafting", level: 32, xp: 324, percent: 70, description: 'test tooltip'},
    {label: "Diving", level: 35, xp: 324, percent: 56, description: 'test tooltip'},
    {label: "Driving", level: 35, xp: 324, percent: 42, description: 'test tooltip'},
    {label: "Drugs", level: 35, xp: 324, percent: 62, description: 'test tooltip'},
    {label: "Gunsmithing", level: 35, xp: 324, percent: 5, description: 'test tooltip'},
    {label: "Mixology", level: 35, xp: 324, percent: 14, description: 'test tooltip'},
    {label: "Shooting", level: 35, xp: 324, percent: 19, description: 'test tooltip'},
    {label: "Stamina", level: 35, xp: 324, percent: 90, description: 'test tooltip'},
    {label: "Strength", level: 35, xp: 324, percent: 86, description: 'test tooltip'},
    {label: "Woodcutting", level: 35, xp: 324, percent: 26, description: 'test tooltip'}
  ],
};

// debugData([
//   {
//     action: "setData",
//     data: mockData,
//   },
// ])

const App: React.FC = () => {
  const [visible, setVisible] = useState(false);
  const [data, setData] = useState<Props>(mockData);

  useNuiEvent<Props>("setData", (newData) => {
    setData((data) => ({ ...data, ...newData }));
  });
  useNuiEvent("setVisible", setVisible);

  return (
    <>
    <Fade in={visible}>
      <Box padding={50} >
        <Container borderRadius={4} bg='#282c34' maxW='625px' text-align='center' display='flex' justify-content='space-around' align-items='center' centerContent={true} padding='10px 0px 5px 0'>
          <Flex bg="gray.800" color='#29c785' borderRadius={4} width='96%' display='flex' justify-content='center' >
            <Container maxW='35%' centerContent={true} padding='12px 0px 12px 0'>
                <Heading size='md'>
                  Skills
                </Heading>
            </Container>
          </Flex>
          <SimpleGrid columns={1} padding='5px 0px 5px 0'>
              <SkillsList skills={data.skills} />
          </SimpleGrid>
        </Container>
      </Box>
    </Fade>
  </>
  );
}

export default App;
