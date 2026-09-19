import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../database/app_database.dart';

class LearningSeedService {
  const LearningSeedService();

  Future<void> seedRadioNavigation(AppDatabase database) async {
    final existing = await (database.select(database.subjects)
          ..where((table) => table.title.equals('Air Navigation')))
        .getSingleOrNull();

    if (existing != null) return;

    await database.transaction(() async {
      final subjectId = await database.into(database.subjects).insert(
            SubjectsCompanion.insert(
              title: 'Air Navigation',
              description: const Value(
                'Foundational navigation concepts for aviation learning.',
              ),
            ),
          );

      final chapterId = await database.into(database.chapters).insert(
            ChaptersCompanion.insert(
              subjectId: subjectId,
              title: 'Radio Navigation',
              description: const Value(
                'Introduction to radio navigation, VOR, bearings, interception, tracking and DME.',
              ),
              sortOrder: const Value(1),
            ),
          );

      final units = <Map<String, dynamic>>[
        {
          'title': 'Introduction to Radio Navigation',
          'blocks': [
            'Radio navigation uses radio-based signals and airborne equipment to support aircraft navigation when visual references are insufficient.',
            'The learning sequence introduces terminology and operating concepts used by common radio-navigation systems.',
          ],
        },
        {
          'title': 'VOR Principles',
          'blocks': [
            'VOR (VHF Omnidirectional Range) provides an azimuth reference from a ground station.',
            'A VOR radial is identified by its magnetic bearing from the station.',
          ],
          'check': {
            'question': 'What does a VOR radial represent?',
            'options': [
              'A magnetic bearing from the VOR station',
              'The aircraft altitude above the station',
              'The slant range to the station',
              'The aircraft ground speed',
            ],
            'correct': 0,
            'explanation':
                'A VOR radial is referenced as a magnetic bearing extending outward from the VOR station.',
          },
        },
        {
          'title': 'Radials & Bearings',
          'blocks': [
            'A bearing describes the direction of a station or point relative to a defined reference.',
            'A radial is specifically referenced outward from a VOR station.',
          ],
        },
        {
          'title': 'Interception',
          'blocks': [
            'Interception is the process of establishing an aircraft onto a selected navigation course.',
            'A learner should distinguish between joining a course and maintaining that course after interception.',
          ],
          'check': {
            'question': 'What is the primary purpose of course interception?',
            'options': [
              'To establish the aircraft onto the selected navigation course',
              'To calculate aircraft fuel quantity',
              'To determine cabin altitude',
              'To measure runway length',
            ],
            'correct': 0,
            'explanation':
                'Interception establishes the aircraft onto the selected navigation course.',
          },
        },
        {
          'title': 'Tracking',
          'blocks': [
            'Tracking means maintaining the desired navigation course after establishing it.',
            'Wind and aircraft movement can create deviations that require correction.',
          ],
        },
        {
          'title': 'DME',
          'blocks': [
            'DME (Distance Measuring Equipment) provides slant-range distance information between the aircraft and a compatible ground station.',
            'DME distance is a slant distance rather than a direct measurement of horizontal ground distance.',
          ],
          'check': {
            'question': 'What does DME primarily provide?',
            'options': [
              'Slant-range distance to a compatible station',
              'Aircraft magnetic heading only',
              'Wind direction only',
              'Runway elevation only',
            ],
            'correct': 0,
            'explanation':
                'DME provides slant-range distance information between the aircraft and a compatible ground station.',
          },
        },
        {
          'title': 'Practical Applications',
          'blocks': [
            'Radio-navigation concepts are combined during practical navigation tasks.',
            'The assessment engine will later use these learning topics for practice and remediation.',
          ],
        },
      ];

      for (var index = 0; index < units.length; index++) {
        final unit = units[index];

        final unitId = await database.into(database.learningUnits).insert(
              LearningUnitsCompanion.insert(
                chapterId: chapterId,
                title: unit['title'] as String,
                sortOrder: Value(index + 1),
              ),
            );

        final blocks = unit['blocks'] as List<String>;

        for (var i = 0; i < blocks.length; i++) {
          await database.into(database.contentBlocks).insert(
                ContentBlocksCompanion.insert(
                  learningUnitId: unitId,
                  blockType: 'text',
                  contentText: blocks[i],
                  sortOrder: Value(i + 1),
                ),
              );
        }

        final check = unit['check'] as Map<String, dynamic>?;

        if (check != null) {
          await database.into(database.knowledgeChecks).insert(
                KnowledgeChecksCompanion.insert(
                  learningUnitId: unitId,
                  question: check['question'] as String,
                  optionsJson: jsonEncode(check['options']),
                  correctOptionIndex: check['correct'] as int,
                  explanation: Value(
                    check['explanation'] as String,
                  ),
                ),
              );
        }
      }
    });
  }
}
