import { useContext } from "react";
import { Stack, Flex, Text, Tag, Progress, Tooltip, SimpleGrid} from "@chakra-ui/react";
import { Skill } from "../../interfaces/skill";

interface Props {
  skills: Array<Skill>;
}

const SkillsList: React.FC<Props> = (props: Props) => {

  return (

    <SimpleGrid columns={2} spacing={4}>
      {props.skills.map((skill, index) => (
        <Tooltip label={skill.description} aria-label='A tooltip'>
            <Flex key={index} w="290px" p={2} justifyContent="space-between" color='#29c785' bg="gray.800" borderRadius={4}>
                <Stack spacing={3}>
                    <Text noOfLines={1} casing="uppercase" fontWeight="medium">
                        {skill.label}
                    </Text>
                    <Progress value={skill.percent} w='190px' size='lg' colorScheme='green'/>
                </Stack>
                <Stack spacing={1}>
                    <Tag>XP: {skill.xp}</Tag>
                    <Tag>Level: {skill.level}</Tag>
                </Stack>
            </Flex>
        </Tooltip>
      ))}
    </SimpleGrid>
  );
};

export default SkillsList;